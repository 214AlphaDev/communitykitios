//
//  MemberVerificationStatusFlow.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 5/8/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

public protocol MemberVerificationStatusFlowProtocol: Flow {}

public class MemberVerificationStatusFlow: SingleScreenFlow, MemberVerificationStatusFlowProtocol, MemberVerificationStatusPresenterDelegate {
    
    public required init(presenter: MemberVerificationStatusPresenterProtocol) {
        super.init(presenter: presenter)
        
        presenter.delegate = WeakWrapper(self)
    }
    
    // MARK: MemberVerificationStatusPresenterDelegate
    
    public func presenterRequestedNavigationToMainApp(_ presenter: MemberVerificationStatusPresenterProtocol) throws {
        try handle(action: MemberVerificationCompletedAction())
    }
    
    public func presenterRequestedNavigationToSendApplication(_ presenter: MemberVerificationStatusPresenterProtocol) throws {
        try handle(action: PopStatusScreenAction())
    }
    
    
}
