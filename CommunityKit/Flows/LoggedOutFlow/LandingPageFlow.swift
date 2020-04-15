//
//  LandingPageFlow.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 5/6/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

public protocol LandingPageFlowProtocol: Flow {}

public class LandingPageFlow: SingleScreenFlow, LandingPageFlowProtocol, LandingPagePresenterDelegate {
    
    init (presenter: LandingPagePresenterProtocol) {
        super.init(presenter: presenter)
        
        presenter.delegate = WeakWrapper(self)
    }
    
    public func presenterRequestedNavigateToLogin(_ presenter: LandingPagePresenterProtocol) throws {
        try handle(action: PushRequestLoginAction())
    }
    
    public func presenterRequestedNavigateToSignUp(_ presenter: LandingPagePresenterProtocol) throws {
        try handle(action: PushSignUpAction())
    }
    
}
