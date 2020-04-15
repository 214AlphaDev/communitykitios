//
//  LoginService.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/27/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

public class LoginService: LoginServiceProtocol {
    
    let accessMaterialRepository: AccessMaterialRepositoryProtocol
    let loginBackend: LoginBackendProtocol
    
    public init(accessMaterialRepository: AccessMaterialRepositoryProtocol, loginBackend: LoginBackendProtocol) {
        self.accessMaterialRepository = accessMaterialRepository
        self.loginBackend = loginBackend
    }
 
    public func loggedInMemberAccessMaterial() throws -> AccessMaterial? {
        return try accessMaterialRepository.getAccessMaterial()
    }
    
    public func logout() throws {
        try accessMaterialRepository.clearAccessMaterial()
    }
    
    public func signUp(_ data: SignUpData, callback: @escaping (Response<Member>) -> Void) {
        loginBackend.signUp(data: data, callback: callback)
    }
    
    public func requestLogin(emailAddress: EmailAddress, callback: @escaping (Response<Void>) -> Void) {
        loginBackend.requestLogin(emailAddress: emailAddress, callback: callback)
    }
    
    public func login(emailAddress: EmailAddress, confirmationCode: ConfirmationCode, callback: @escaping (Response<AccessMaterial>) -> Void) {
        let keyPair = MemberAccessKeyPair.factory()
        
        loginBackend.login(emailAddress: emailAddress, confirmationCode: confirmationCode, memberAccessPublicKey: keyPair.hexPublicKey()) { [weak self] response in
            guard let self = self else {
                callback(.failure(ResponseError.unknownError))
                return
            }
            
            switch response {
            case .failure(let error):
                callback(.failure(error))
                return
            case .success(let result):
                let accessMaterial = AccessMaterial(accessToken: result.accessToken, memberAccessKeyPair: keyPair)
                do {
                    try self.accessMaterialRepository.persist(accessMaterial: accessMaterial)
                } catch {
                    callback(.failure(error))
                    return
                }
                callback(.success(accessMaterial))
                return
            }
        }
    }
    
}
