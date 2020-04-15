//
//  Errors.swift
//  CommunityKitError
//
//  Created by Andrii Selivanov on 3/14/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

protocol CommunityKitError: Error {
    var errorDescription: String { get }
}

enum ValidationError: CommunityKitError {
    case invalidEmailAddress
    case invalidUsername
    case invalidProfilePicture
    case invalidProfilePictureData
    case invalidConfirmationCode
    case invalidFirstName
    case invalidLastName
    case invalidUUIDV4String
    case jwtMissingExpiredAt
    case jwtMissingSubject
    case emptyApplicationText
    case applicationTextTooLong
    
    var errorDescription: String {
        switch self {
        case .invalidEmailAddress:
            return "Provided email address is invalid"
        case .invalidUsername:
            return "Provided username is invalid"
        case .invalidProfilePicture:
            return "Provided picture is invalid"
        case .invalidProfilePictureData:
            return "Provided picture data is invalid"
        case .invalidConfirmationCode:
            return "Provided confirmation code is invalid"
        case .invalidFirstName:
            return "Provided first name is invalid"
        case .invalidLastName:
            return "Provided first name is invalid"
        case .invalidUUIDV4String:
            return "Provided uuidv4 string is invalid"
        case .jwtMissingExpiredAt:
            return "Provided JWT missing expiredAt attribute"
        case .jwtMissingSubject:
            return "Provided JWT missing subject"
        case .emptyApplicationText:
            return "Member verification application can't be empty"
        case .applicationTextTooLong:
            return "Member verification application is too long"
        }
    }
}

enum ResponseError: CommunityKitError {
    
    case requestFailed(serverErrorMessage: String)
    case missingResponseAndError
    case memberResponseMissingEmailAddress
    case usernameTaken
    case emailAddressTaken
    case unknownError
    case emailAddressNotRegistered
    case loginRequestForbidden(tillDate: Date)
    
    case confirmationCodeAlreadyUsed
    case confirmationCodeMemberMismatch
    case confirmationCodeNotFound
    case confirmationCodeExpired
    case memberAccessKeyHasAlreadyBeenUsed
    
    case unknownMembershipApplicationState
    case noApprovedAtDate
    case noRejectedAtDate
    case invalidCreatedAtDate
    
    case alreadyVerified
    case alreadyPendingApplication
    
    case applicationNotFound
    case unauthenticated
    case insufficientPermissions
    case notAllowedToAccessApplication
    
    case applicationAlreadyReviewed
    
    var errorDescription: String {
        switch self {
        case .requestFailed(let message):
            return "Request failed with error message: \(message)"
        case .missingResponseAndError:
            return "Server responded without any response or error. Please report this issue"
        case .memberResponseMissingEmailAddress:
            return "Server responded with member that missing e-mail address. Please report this issue"
        case .usernameTaken:
            return "Username is already taken"
        case .emailAddressTaken:
            return "Email address is already taken"
        case .loginRequestForbidden(let tillDate):
            return "Please wait for \(Int(tillDate.timeIntervalSinceNow)) seconds before next login request"
        case .emailAddressNotRegistered:
            return "Provided e-mail address is not registered"
        case .unknownError:
            return "Something went wrong"
        case .confirmationCodeAlreadyUsed:
            return "That confirmation code has already been used"
        case .confirmationCodeNotFound:
            return "Confirmation code is not correct"
        case .confirmationCodeExpired:
            return "That confirmation code is expired. Please request a new one"
        case .confirmationCodeMemberMismatch:
            return "Confirmation code member mismatch"
        case .memberAccessKeyHasAlreadyBeenUsed:
            return "Member access key has already been used"
        case .unknownMembershipApplicationState:
            return "Membership application should have state from the defined set of possible values, but unknown one provided"
        case .noApprovedAtDate:
            return "Membership application is approved, but there is no \"approved at\" date"
        case .noRejectedAtDate:
            return "Membership application is rejected, but there is no \"rejected at\" date"
        case .invalidCreatedAtDate:
            return "CreatedAt date has invalid format"
        case .alreadyVerified:
            return "You're already a verified member of the community"
        case .alreadyPendingApplication:
            return "You have already had a pending verification application"
            
        case .applicationNotFound:
            return "Member application not found"
        case .unauthenticated:
            return "Not authorized"
        case .insufficientPermissions:
            return "You have no permissions to do that"
        case .notAllowedToAccessApplication:
            return "You can't access the application"
            
        case .applicationAlreadyReviewed:
            return "This application has already been reviewed"
        }
    }
    
}

class TranslatableError: LocalizedError {
    private let message: String
    var errorDescription: String? {
        return message
    }
    init(message: String) {
        self.message = message
    }
}


enum PersistenceError: CommunityKitError {
    
    case applicationPersistenceFailed(underlyingError: Error)
    
    var errorDescription: String {
        switch self {
        case .applicationPersistenceFailed(let underlyingError):
            return "Failed to persist application with underlying error \(ErrorDescription.describe(error: underlyingError) ?? underlyingError.localizedDescription)"
        }
    }
    
}
