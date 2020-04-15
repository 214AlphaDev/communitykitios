//
//  Errors+GraphQL.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/15/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

extension ResponseError {
    
    init(signUpError: SignUpError) {
        switch signUpError {
        case .emailAddressTaken:
            self = .emailAddressTaken
        case .usernameTaken:
            self = .usernameTaken
        case .__unknown(_):
            self = .unknownError
        }
    }
    
    init(loginError: LoginError) {
        switch loginError {
        case .confirmationCodeExpired:
            self = .confirmationCodeExpired
        case .confirmationCodeMemberMismatch:
            self = .confirmationCodeMemberMismatch
        case .confirmationCodeNotFound:
            self = .confirmationCodeNotFound
        case .confirmationCodeAlreadyUsed:
            self = .confirmationCodeAlreadyUsed
        case .memberAccessKeyHasAlreadyBeenUsed:
            self = .memberAccessKeyHasAlreadyBeenUsed
        case .__unknown(_):
            self = .unknownError
        }
    }
    
}
