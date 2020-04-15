//
//  SignUpFlow.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 5/6/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

public protocol SignUpFlowProtocol: Flow {}

public class SignUpFlow: SingleScreenFlow, SignUpFlowProtocol, SignUpPresenterDelegate {
    
    init (presenter: SignUpPresenterProtocol) {
        super.init(presenter: presenter)
        
        presenter.delegate = WeakWrapper(self)
    }
    
    public func presenter(_ presenter: SignUpPresenterProtocol, requestedNavigateToConfirmationWithEmailAddress emailAddress: EmailAddress) throws {
        try self.handle(action: PushConfirmLoginAction(emailAddress: emailAddress))
    }
    
}
