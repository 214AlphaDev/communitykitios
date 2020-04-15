//
//  AccessToken+ValueObject.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/27/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import JWTDecode

public struct AccessToken {
    
    public let expiresAt: Date
    public let rawAccessToken: String
    public let subject: UUIDV4
    
    public init(jwtString: String) throws {
        let decoded = try decode(jwt: jwtString)
        guard let expiresAt = decoded.expiresAt else {
            throw ValidationError.jwtMissingExpiredAt
        }
        guard let subject = decoded.subject else {
            throw ValidationError.jwtMissingSubject
        }
        
        self.expiresAt = expiresAt
        self.rawAccessToken = decoded.string
        self.subject = try UUIDV4(subject)
    }
    
    public func expired() -> Bool {
        switch expiresAt.compare(Date()) {
        case .orderedDescending:
            return false
        case .orderedAscending, .orderedSame:
            return true
        }
    }
    
}
