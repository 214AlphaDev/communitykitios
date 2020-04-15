//
//  LoginBackend.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/15/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import Apollo

public class LoginBackend: LoginBackendProtocol {
    
    var apollo: ApolloClient
    
    public init(url: URL) {
        self.apollo = ApolloClient(url: url)
    }
    
    public func signUp(data: SignUpData, callback: @escaping (Response<Member>) -> Void) {
        self.apollo.perform(mutation:
            SignUpMutation(
                input: SignUpInput(
                    username: data.username.username,
                    emailAddress: data.emailAddress.emailAddress,
                    properName: ProperNameInput(
                        firstName: data.properName.firstName,
                        lastName: data.properName.lastName
                    ),
                    profilePicture: data.profilePicture?.pictureDataString
                )
            )
        ) { result, error in
            if let error = error {
                callback(.failure(ResponseError.requestFailed(serverErrorMessage:  error.localizedDescription)))
                return
            }
            
            guard let response = result?.data?.signUp else {
                callback(.failure(ResponseError.missingResponseAndError))
                return
            }
            
            if let error = response.error {
                callback(.failure(ResponseError(signUpError: error)))
                return
            }
            
            guard let memberOutput = response.member else {
                callback(.failure(ResponseError.missingResponseAndError))
                return
            }
            
            do {
                callback(.success(try Member(memberOutput: memberOutput)))
            } catch {
                callback(.failure(error))
            }
        }
        
    }
    
    /// Function to request login - meaning to send confirmatino code to specified e-mail in order to login or confirm e-mail
    ///
    /// - Parameters:
    ///   - emailAddress: Email address to send confirmation code
    ///   - callback: Callback returns a void response or error.
    public func requestLogin(emailAddress: EmailAddress, callback: @escaping (Response<Void>) -> Void) {
        self.apollo.perform(mutation: RequestLoginMutation(emailAddress: emailAddress.emailAddress)) { result, error in
            if let error = error {
                callback(.failure(ResponseError.requestFailed(serverErrorMessage:  error.localizedDescription)))
                return
            }
            
            guard let nextRequestTimestamp = result?.data?.requestLogin else {
                callback(.failure(ResponseError.emailAddressNotRegistered))
                return
            }
            
            if nextRequestTimestamp > 0 {
                callback(.failure(ResponseError.loginRequestForbidden(tillDate: Date.init(timeIntervalSince1970: TimeInterval(nextRequestTimestamp)))))
                return
            }
            
            callback(.success(()))
        }
    }

    public func login(emailAddress: EmailAddress, confirmationCode: ConfirmationCode, memberAccessPublicKey: String, callback: @escaping (Response<(member: Member, accessToken: AccessToken)>) -> Void) {
        apollo.perform(mutation:
            LoginMutation(input:
                LoginInput(
                    emailAddress: emailAddress.emailAddress,
                    memberAccessPublicKey: memberAccessPublicKey,
                    confirmationCode: confirmationCode.code)))
        { result, error in
            if let error = error {
                callback(.failure(ResponseError.requestFailed(serverErrorMessage:  error.localizedDescription)))
                return
            }
            
            guard let response = result?.data?.login else {
                callback(.failure(ResponseError.missingResponseAndError))
                return
            }
            
            if let error = response.error {
                callback(.failure(ResponseError(loginError: error)))
                return
            }
            
            guard let memberOutput = response.member, let accessToken = response.accessToken else {
                callback(.failure(ResponseError.missingResponseAndError))
                return
            }
            
            do {
                callback(.success((member: try Member(memberOutput: memberOutput), accessToken: try AccessToken(jwtString: accessToken))))
            } catch {
                callback(.failure(error))
            }
        }
    }
    
}
