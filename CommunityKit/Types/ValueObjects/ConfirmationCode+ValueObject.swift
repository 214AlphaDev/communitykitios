//
//  ConfirmationCode+ValueObject.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/16/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

public struct ConfirmationCode {
    
    public let code: String
    
    public init(_ code: String) throws {
        if case .invalid(let error) = ConfirmationCode.validateCode(code) {
            throw error
        }
        
        self.code = code
    }
    
    public static func validateCode(_ code: String) -> ValidationResult {
        let confirmationCodeRegEx = "[0-9]{6}"
        let codeTest = NSPredicate(format: "SELF MATCHES %@", confirmationCodeRegEx)
        if !codeTest.evaluate(with: code) {
            return .invalid(ValidationError.invalidConfirmationCode)
        }
        
        return .valid
    }
    
}
