//
//  LoginServiceProtocol.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/23/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

public protocol LoginServiceProtocol {
    
    /// Gets access material for member that is currently logged in or was logged in before and didn't logout.
    ///
    /// - Returns: Nil if there is no member logged in and access material otherwise
    func loggedInMemberAccessMaterial() throws -> AccessMaterial?
    func logout() throws
    func login(emailAddress: EmailAddress, confirmationCode: ConfirmationCode, callback: @escaping (Response<AccessMaterial>) -> Void)
    func signUp(_ data: SignUpData, callback: @escaping (Response<Member>) -> Void)
    func requestLogin(emailAddress: EmailAddress, callback: @escaping (Response<Void>) -> Void)
    
}
