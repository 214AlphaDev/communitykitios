//
//  Member+GraphQL.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/16/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

extension Member {
    
    init(memberOutput: SignUpMutation.Data.SignUp.Member) throws {
        let id = try UUIDV4(memberOutput.id)
        let username = try Username(memberOutput.username)
        let properName = try ProperName(
            firstName: memberOutput.name.firstName,
            lastName: memberOutput.name.lastName
        )
        guard let emailAddressString = memberOutput.emailAddress else {
            throw ResponseError.memberResponseMissingEmailAddress
        }
        let emailAddress = try EmailAddress(emailAddressString)
        var profilePicture: ProfilePicture?
        if let profilePictureString = memberOutput.profilePicture {
            profilePicture = try ProfilePicture(profilePictureString)
        }
        
        self = Member(
            id: id,
            properName: properName,
            username: username,
            profilePicture: profilePicture,
            emailAddress: emailAddress,
            isAdmin: memberOutput.admin)
    }
    
    init(memberOutput: LoginMutation.Data.Login.Member) throws {
        let id = try UUIDV4(memberOutput.id)
        let username = try Username(memberOutput.username)
        let properName = try ProperName(
            firstName: memberOutput.name.firstName,
            lastName: memberOutput.name.lastName
        )
        guard let emailAddressString = memberOutput.emailAddress else {
            throw ResponseError.memberResponseMissingEmailAddress
        }
        let emailAddress = try EmailAddress(emailAddressString)
        var profilePicture: ProfilePicture?
        if let profilePictureString = memberOutput.profilePicture {
            profilePicture = try ProfilePicture(profilePictureString)
        }
        
        self = Member(
            id: id,
            properName: properName,
            username: username,
            profilePicture: profilePicture,
            emailAddress: emailAddress,
            isAdmin: memberOutput.admin)
    }
    
}
