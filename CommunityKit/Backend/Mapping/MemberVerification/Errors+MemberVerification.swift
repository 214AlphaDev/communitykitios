//
//  Errors+GraphQL.swift
//  CommunitySDK
//
//  Created by Andrii Selivanov on 3/18/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

extension ResponseError {
    
    init(applyForVerificationError: ApplyForVerificationError) {
        switch applyForVerificationError {
        case .alreadyVerified:
            self = .alreadyVerified
        case .pendingApplication:
            self = .alreadyPendingApplication
        case .__unknown(_):
            self = .unknownError
        }
    }
    
}
