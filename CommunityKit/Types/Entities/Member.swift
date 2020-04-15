//
//  Member.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/23/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

public struct Member {
    
    public let id: UUIDV4
    public let properName: ProperName
    public let username: Username
    public let profilePicture: ProfilePicture?
    public let emailAddress: EmailAddress
    public let isAdmin: Bool
    
    public init(id: UUIDV4, properName: ProperName, username: Username, profilePicture: ProfilePicture?, emailAddress: EmailAddress, isAdmin: Bool) {
        self.id = id
        self.properName = properName
        self.username = username
        self.profilePicture = profilePicture
        self.emailAddress = emailAddress
        self.isAdmin = isAdmin
    }
    
}
