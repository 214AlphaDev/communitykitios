//
//  username+ValueObject.swift
//  s33d
//
//  Created by Alberto R. Estarrona on 2/25/19.
//  Copyright © 2019 214Alpha. All rights reserved.
//

import Foundation
import FlowKit

public struct Username: CustomStringConvertible {
    
    public let username: String
    
    public var description: String {
        return username
    }
    
    public init(_ username: String) throws {
        if case .invalid(let error) = Username.validateUsername(username) {
            throw error
        }
        
        self.username = username
    }
    
    public static func validateUsername(_ username: String) -> ValidationResult {
        let usernameRegEx = "[a-z0-9_]+"
        let usernameTest = NSPredicate(format: "SELF MATCHES %@", usernameRegEx)
        if !usernameTest.evaluate(with: username) {
            return .invalid(ValidationError.invalidUsername)
        }
        
        return .valid
    }
    
}
