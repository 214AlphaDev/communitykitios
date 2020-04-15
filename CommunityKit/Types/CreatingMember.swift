//
//  CreatingMember.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/25/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

/// Struct that holds values of member object that is created
struct CreatingMember {
    var username : Username?
    var firstName: String
    var lastName: String
    var emailAddress : EmailAddress?
    var profilePicture: ProfilePicture?
    
    func convertToSignUpData() throws -> SignUpData {
        guard let username = username else {
            throw ValidationError.invalidUsername
        }
        
        let properName = try ProperName(firstName: firstName, lastName: lastName)
        
        guard let emailAddress = emailAddress else {
            throw ValidationError.invalidEmailAddress
        }
        
        return SignUpData(username: username, properName: properName, emailAddress: emailAddress, profilePicture: profilePicture)
    }
}
