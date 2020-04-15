//
//  Login+MVP.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/22/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

public protocol LoginPresenterDelegate: class {
    func presenter(_ presenter: LoginPresenterProtocol, requestedNavigateToLoggedInFlowWith accessMaterial: AccessMaterial) throws
}

public protocol LoginPresenterProtocol: Presenter, Cleanable {
    var view: LoginViewProtocol { get }
    var delegate: WeakWrapper<LoginPresenterDelegate> { get set }
    
    func validate(confirmationCode: String) -> ValidationResult
    
    func setConfirmationCode(_ code: String)
    func resendConfirmationCode()
    func confirm()
}

public protocol LoginViewProtocol: class, ViewControllerProvider, ErrorDisplayable, LoadingIndicatorDisplayable, Cleanable {
    var presenter: WeakWrapper<LoginPresenterProtocol> { get set }
    
    func showConfirmationCodeSuccessfulSend()
    func setConfirmButtonEnabled(_ enabled: Bool)
}
