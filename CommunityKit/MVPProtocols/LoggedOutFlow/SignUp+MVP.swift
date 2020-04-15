//
//  SignUp+MVP.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/22/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

public protocol SignUpPresenterDelegate: class {
    func presenter(_ presenter: SignUpPresenterProtocol, requestedNavigateToConfirmationWithEmailAddress emailAddress: EmailAddress) throws
}

public enum SignUpValidationField {
    case username(String)
    case firstName(String)
    case lastName(String)
    case emailAddress(String)
}

public protocol SignUpPresenterProtocol: Presenter, Cleanable {
    var view: SignUpViewProtocol { get }
    var delegate: WeakWrapper<SignUpPresenterDelegate> { get set }
    
    func validate(field: SignUpValidationField) -> ValidationResult
    
    func clearProfilePicture()
    func setProfilePicture(_ image: UIImage)
    func setUsername(_ username: String)
    func setFirstName(_ firstName: String)
    func setEmailAddress(_ emailAddress: String)
    func setLastName(_ lastName: String)
    
    func submit()
}

public protocol SignUpViewProtocol: class, ViewControllerProvider, ErrorDisplayable, LoadingIndicatorDisplayable, Cleanable {
    var presenter: WeakWrapper<SignUpPresenterProtocol> { get set }
    
    func setSubmitButtonEnabled(_ enabled: Bool)
}
