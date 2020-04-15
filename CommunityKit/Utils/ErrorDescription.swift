//
//  ErrorDescription.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/15/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

public struct ErrorDescription {
    
    public static func describe(error: Error) -> String? {
        guard let communityKitError = error as? CommunityKitError else {
            return nil
        }
        
        return communityKitError.errorDescription
    }
    
}
