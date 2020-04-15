//
//  RequestLoginFlow.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 5/6/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

public protocol RequestLoginFlowProtocol: Flow {}

public class RequestLoginFlow: SingleScreenFlow, RequestLoginFlowProtocol, RequestLoginPresenterDelegate {
    
    init (presenter: RequestLoginPresenterProtocol) {
        super.init(presenter: presenter)

        presenter.delegate = WeakWrapper(self)
    }
    
    public func presenter(_ presenter: RequestLoginPresenterProtocol, requestedNavigateToLoginConfirmationWithEmailAddress emailAddress: EmailAddress) throws {
        try self.handle(action: PushConfirmLoginAction(emailAddress: emailAddress))
    }
    
}
