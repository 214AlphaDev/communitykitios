//
//  MemberBackend.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/31/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import Apollo

public class MemberBackend: MemberBackendProtocol {
    
    var apollo: ApolloClient
    
    public init(url: URL, accessMaterial: AccessMaterial) {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["Authorization-Bearer": accessMaterial.accessToken.rawAccessToken]
        self.apollo = ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
    }
    
    public func currentMember(callback: @escaping (Response<Member>) -> Void) {
        apollo.fetch(query: CurrentMemberQuery(), cachePolicy: .fetchIgnoringCacheData) { result, error in
            if let error = error {
                callback(.failure(ResponseError.requestFailed(serverErrorMessage:  error.localizedDescription)))
                return
            }
            
            guard let response = result?.data?.myMember else {
                callback(.failure(ResponseError.missingResponseAndError))
                return
            }
            
            do {
                callback(.success(try Member(output: response)))
            } catch {
                callback(.failure(error))
            }
        }
    }
    
}
