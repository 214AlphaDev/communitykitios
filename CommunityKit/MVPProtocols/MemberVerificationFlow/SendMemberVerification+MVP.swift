//
//  SendMemberVerification+MVP.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/29/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

public protocol SendMemberVerificationPresenterDelegate: class {
    func presenter(_ presenter: SendMemberVerificationPresenterProtocol, requestNavigateToStatusScreenWith application: MemberVerificationApplication) throws
}

public protocol SendMemberVerificationPresenterProtocol: Presenter {
    var view: SendMemberVerificationViewProtocol { get }
    var delegate: WeakWrapper<SendMemberVerificationPresenterDelegate> { get set }
    
    func validate(applicationText: String) -> ValidationResult
    func setApplicationText(_ text: String)
    
    func submit()
}

public protocol SendMemberVerificationViewProtocol: class, ViewControllerProvider, ErrorDisplayable, LoadingIndicatorDisplayable {
    var presenter: WeakWrapper<SendMemberVerificationPresenterProtocol> { get set }
    
    func setSubmitButtonEnabled(_ enabled: Bool)
}
