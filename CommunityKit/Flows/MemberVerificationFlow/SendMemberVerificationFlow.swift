//
//  SendMemberVerificationFlow.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 5/8/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

public protocol SendMemberVerificationFlowProtocol: Flow {
    
    var presenter: SendMemberVerificationPresenterProtocol { get }
    
}

public class SendMemberVerificationFlow: SingleScreenFlow, SendMemberVerificationFlowProtocol, SendMemberVerificationPresenterDelegate {
    
    public var presenter: SendMemberVerificationPresenterProtocol {
        return basePresenter as! SendMemberVerificationPresenterProtocol
    }
    
    public required init(presenter: SendMemberVerificationPresenterProtocol) {
        super.init(presenter: presenter)
        
        presenter.delegate = WeakWrapper(self)
    }
    
    // MARK: SendMemberVerificationPresenterDelegate
    
    public func presenter(_ presenter: SendMemberVerificationPresenterProtocol, requestNavigateToStatusScreenWith application: MemberVerificationApplication) throws {
        try handle(action: PushMemberVerificationStatusScreenAction(application: application, animated: true))
    }
    
}
