//
//  MemberVerificationBackend.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/30/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import Apollo

public class MemberVerificationBackend: MemberVerificationBackendProtocol {
    
    var apollo: ApolloClient
    
    public init(url: URL, accessMaterial: AccessMaterial) {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["Authorization-Bearer": accessMaterial.accessToken.rawAccessToken]
        self.apollo = ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
    }

    public func applyForVerification(applicationText: MemberVerificationApplicationText, callback: @escaping (Response<MemberVerificationApplication>) -> Void) {
        apollo.perform(mutation:
            ApplyForVerificationMutation(applicationText: applicationText.applicationText)
            ) { result, error in
            if let error = error {
                callback(.failure(ResponseError.requestFailed(serverErrorMessage:  error.localizedDescription)))
                return
            }
            
            guard let response = result?.data?.applyForVerification else {
                callback(.failure(ResponseError.missingResponseAndError))
                return
            }
            
            if let error = response.error {
                callback(.failure(ResponseError(applyForVerificationError: error)))
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
    
    public func myCurrentApplication(callback: @escaping (Response<MemberVerificationApplication?>) -> Void) {
        apollo.fetch(query: MyCurrentApplicationQuery(), cachePolicy: .fetchIgnoringCacheData) { result, error in
            if let error = error {
                callback(.failure(ResponseError.requestFailed(serverErrorMessage:  error.localizedDescription)))
                return
            }
            
            guard let response = result?.data?.myCurrentApplication else {
                callback(.success(nil))
                return
            }
            
            do {
                callback(.success(try MemberVerificationApplication(output: response)))
            } catch {
                callback(.failure(error))
            }
        }
    }
    
}
