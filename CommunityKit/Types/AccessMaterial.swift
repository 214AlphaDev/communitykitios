//
//  AccessMaterial.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/27/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

public struct AccessMaterial {
    public let accessToken: AccessToken
    public let memberAccessKeyPair: MemberAccessKeyPair
    
    public init(accessToken: AccessToken, memberAccessKeyPair: MemberAccessKeyPair) {
        self.accessToken = accessToken
        self.memberAccessKeyPair = memberAccessKeyPair
    }
}
