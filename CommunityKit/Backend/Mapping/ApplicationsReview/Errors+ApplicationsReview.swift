//
//  Errors+ApplicationsReview.swift
//  CommunitySDK
//
//  Created by Andrii Selivanov on 3/18/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

extension ResponseError {
    
    init(fetchApplicationsError: ApplicationsResponseError) {
        switch fetchApplicationsError {
        case .applicationNotFound:
            self = .applicationNotFound
        case .unauthenticated:
            self = .unauthenticated
        case .insufficientPermissions:
            self = .insufficientPermissions
        case .notAllowedToAccessApplication:
            self = .notAllowedToAccessApplication
        case .__unknown(_):
            self = .unknownError
        }
    }
    
    init(approveApplicationError: ApproveApplicationError) {
        switch approveApplicationError {
        case .applicationDoesNotExist:
            self = .applicationNotFound
        case .unauthenticated:
            self = .unauthenticated
        case .insufficientPermissions:
            self = .insufficientPermissions
        case .alreadyReviewed:
            self = .applicationAlreadyReviewed
        case .__unknown(_):
            self = .unknownError
        }
    }
    
    init(rejectApplicationError: RejectApplicationError) {
        switch rejectApplicationError {
        case .applicationDoesNotExist:
            self = .applicationNotFound
        case .unauthenticated:
            self = .unauthenticated
        case .insufficientPermissions:
            self = .insufficientPermissions
        case .alreadyReviewed:
            self = .applicationAlreadyReviewed
        case .__unknown(_):
            self = .unknownError
        }
    }
    
}
