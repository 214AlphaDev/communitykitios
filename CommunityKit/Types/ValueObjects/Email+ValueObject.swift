//
//  Email+ValueObject.swift
//  s33d
//
//  Created by Alberto R. Estarrona on 2/26/19.
//  Copyright © 2019 214Alpha. All rights reserved.
//

import Foundation
import FlowKit

public struct EmailAddress: CustomStringConvertible {
    
    public let emailAddress: String
    
    public var description: String {
        return emailAddress
    }
    
    public init(_ emailAddress: String) throws {
        if case .invalid(let error) = EmailAddress.validateEmailAddress(emailAddress) {
            throw error
        }
        
        self.emailAddress = emailAddress
    }
    
    public static func validateEmailAddress(_ emailAddress: String) -> ValidationResult {
        let emailRegEx = "^[\\w\\.-]+@([\\w\\-]+\\.)+[A-Z]{1,4}$"
        let emailTest = NSPredicate(format: "SELF MATCHES[c] %@", emailRegEx)
        if !emailTest.evaluate(with: emailAddress) {
            return .invalid(ValidationError.invalidEmailAddress)
        }
        
        return .valid
    }
}
