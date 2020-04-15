//
//  Member+GraphQL.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/31/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

extension Member {
    
    init(output: CurrentMemberQuery.Data.MyMember) throws {
        let id = try UUIDV4(output.id)
        let username = try Username(output.username)
        let properName = try ProperName(
            firstName: output.name.firstName,
            lastName: output.name.lastName
        )
        guard let emailAddressString = output.emailAddress else {
            throw ResponseError.memberResponseMissingEmailAddress
        }
        let emailAddress = try EmailAddress(emailAddressString)
        var profilePicture: ProfilePicture?
        if let profilePictureString = output.profilePicture {
            profilePicture = try ProfilePicture(profilePictureString)
        }
        
        self = Member(
            id: id,
            properName: properName,
            username: username,
            profilePicture: profilePicture,
            emailAddress: emailAddress,
            isAdmin: output.admin)
    }
    
    init(output: ApplicationsQuery.Data.Application.Application.Member) throws {
        let id = try UUIDV4(output.id)
        let username = try Username(output.username)
        let properName = try ProperName(
            firstName: output.name.firstName,
            lastName: output.name.lastName
        )
        guard let emailAddressString = output.emailAddress else {
            throw ResponseError.memberResponseMissingEmailAddress
        }
        let emailAddress = try EmailAddress(emailAddressString)
        var profilePicture: ProfilePicture?
        if let profilePictureString = output.profilePicture {
            profilePicture = try ProfilePicture(profilePictureString)
        }
        
        self = Member(
            id: id,
            properName: properName,
            username: username,
            profilePicture: profilePicture,
            emailAddress: emailAddress,
            isAdmin: output.admin)
    }
    
}
