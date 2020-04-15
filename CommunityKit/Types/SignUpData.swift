//
//  SignUpData.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/25/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

/// Struct that is used to store information needed to sign up a new member.
public struct SignUpData {
    
    public var username : Username
    public var properName : ProperName
    public var emailAddress : EmailAddress
    public var profilePicture: ProfilePicture?
    
    public init(username: Username, properName: ProperName, emailAddress: EmailAddress, profilePicture: ProfilePicture?) {
        self.username = username
        self.properName = properName
        self.emailAddress = emailAddress
        self.profilePicture = profilePicture
    }
    
}
