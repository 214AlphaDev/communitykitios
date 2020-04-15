//
//  LoginBackendProtocol.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/28/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

public protocol LoginBackendProtocol {
    
    func signUp(data: SignUpData, callback: @escaping (Response<Member>) -> Void)
    func requestLogin(emailAddress: EmailAddress, callback: @escaping (Response<Void>) -> Void)
    func login(emailAddress: EmailAddress, confirmationCode: ConfirmationCode, memberAccessPublicKey: String, callback: @escaping (Response<(member: Member, accessToken: AccessToken)>) -> Void)
    
}
