//
//  MemberVerificationApplicationText+ValueObject.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/29/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

public struct MemberVerificationApplicationText : CustomStringConvertible {
    
    public let applicationText: String
    
    public var description: String {
        return applicationText
    }
    
    public init(_ applicationText: String) throws {
        if case .invalid(let error) = MemberVerificationApplicationText.validateApplicationText(applicationText) {
            throw error
        }
        
        self.applicationText = applicationText
    }
    
    public static func validateApplicationText(_ text: String) -> ValidationResult {
        if text.isEmpty {
            return .invalid(ValidationError.emptyApplicationText)
        }
        if text.count > 1000 {
            return .invalid(ValidationError.applicationTextTooLong)
        }
        return .valid
    }
    
}
