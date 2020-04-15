//
//  RequestLogin+MVP.swift
//  CommunityKit
//
//  Created by Florian on 21.03.19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

public protocol RequestLoginPresenterDelegate: class {
    func presenter(_ presenter: RequestLoginPresenterProtocol, requestedNavigateToLoginConfirmationWithEmailAddress emailAddress: EmailAddress) throws
}

public protocol RequestLoginPresenterProtocol: Presenter, Cleanable {
    var view: RequestLoginViewProtocol { get }
    var delegate: WeakWrapper<RequestLoginPresenterDelegate> { get set }
    
    func validate(emailAddress: String) -> ValidationResult
    
    func setEmailAddress(_ emailAddress: String)
    func requestConfirmationCode()
}

public protocol RequestLoginViewProtocol: class, ViewControllerProvider, ErrorDisplayable, LoadingIndicatorDisplayable, Cleanable {
    var presenter: WeakWrapper<RequestLoginPresenterProtocol> { get set }
    
    func setRequestConfirmationCodeButtonEnabled(_ enabled: Bool)
}
