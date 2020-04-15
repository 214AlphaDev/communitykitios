//
//  ConfirmLoginFlow.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 5/6/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

public protocol ConfirmLoginFlowProtocol: Flow {}

public class ConfirmLoginFlow: SingleScreenFlow, ConfirmLoginFlowProtocol, LoginPresenterDelegate {
    
    init (presenter: LoginPresenterProtocol) {
        super.init(presenter: presenter)

        presenter.delegate = WeakWrapper(self)
    }
    
    public func presenter(_ presenter: LoginPresenterProtocol, requestedNavigateToLoggedInFlowWith accessMaterial: AccessMaterial) throws {
        try handle(action: LoginAction(accessMaterial: accessMaterial))
    }
    
}
