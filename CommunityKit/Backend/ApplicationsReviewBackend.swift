//
//  ApplicationsReviewBackend.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 4/1/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import Apollo

public class ApplicationsReviewBackend: ApplicationsReviewBackendProtocol {
    
    var apollo: ApolloClient
    
    public init(url: URL, accessMaterial: AccessMaterial) {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["Authorization-Bearer": accessMaterial.accessToken.rawAccessToken]
        self.apollo = ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
    }
    
    public func applications(from id: UUIDV4?, count: Int, state: MemberVerificationApplication.State, callback: @escaping (Response<[(MemberVerificationApplication, Member)]>) -> Void) {
        
        apollo.fetch(query: ApplicationsQuery(fromId: id?.id, count: count, state: .pending), cachePolicy: .fetchIgnoringCacheData) { result, error in
            if let error = error {
                callback(.failure(ResponseError.requestFailed(serverErrorMessage:  error.localizedDescription)))
                return
            }
            
            guard let response = result?.data?.applications else {
                callback(.failure(ResponseError.missingResponseAndError))
                return
            }
            
            if let error = response.error {
                callback(.failure(ResponseError(fetchApplicationsError: error)))
                return
            }
            
            do {
                let applications = try response.applications.map { application in
                    return (try MemberVerificationApplication(output: application), try Member(output: application.member))
                }
                
                callback(.success(applications))
            } catch {
                callback(.failure(error))
            }
        }
    }
    
    public func approveApplication(with id: UUIDV4, callback: @escaping (Response<MemberVerificationApplication>) -> Void) {
        apollo.perform(mutation: ApproveApplicationMutation(id: id.id)) { result, error in
            if let error = error {
                callback(.failure(ResponseError.requestFailed(serverErrorMessage:  error.localizedDescription)))
                return
            }
            
            guard let response = result?.data?.approveApplication else {
                callback(.failure(ResponseError.missingResponseAndError))
                return
            }
            
            if let error = response.error {
                callback(.failure(ResponseError(approveApplicationError: error)))
                return
            }
            
            guard let applicationOutput = response.application else {
                callback(.failure(ResponseError.missingResponseAndError))
                return
            }
            
            do {
                callback(.success(try MemberVerificationApplication(output: applicationOutput)))
            } catch {
                callback(.failure(error))
            }
        }
    }
    
    public func rejectApplication(with id: UUIDV4, reason: String, callback: @escaping (Response<MemberVerificationApplication>) -> Void) {
        apollo.perform(mutation: RejectApplicationMutation(id: id.id, reason: reason)) { result, error in
            if let error = error {
                callback(.failure(ResponseError.requestFailed(serverErrorMessage:  error.localizedDescription)))
                return
            }
            
            guard let response = result?.data?.rejectApplication else {
                callback(.failure(ResponseError.missingResponseAndError))
                return
            }
            
            if let error = response.error {
                callback(.failure(ResponseError(rejectApplicationError: error)))
                return
            }
            
            guard let applicationOutput = response.application else {
                callback(.failure(ResponseError.missingResponseAndError))
                return
            }
            
            do {
                callback(.success(try MemberVerificationApplication(output: applicationOutput)))
            } catch {
                callback(.failure(error))
            }
        }
    }
    
}
