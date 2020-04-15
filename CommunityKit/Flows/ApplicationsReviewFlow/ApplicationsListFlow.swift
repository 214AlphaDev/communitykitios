//
//  ApplicationsListFlow.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 5/8/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

public protocol ApplicationsListFlowProtocol: Flow {
    
    var presenter: ApplicationsListPresenterProtocol { get }
    
}

public class ApplicationsListFlow: SingleScreenFlow, ApplicationsListFlowProtocol, ApplicationsListPresenterDelegate {
    
    public var presenter: ApplicationsListPresenterProtocol {
        return basePresenter as! ApplicationsListPresenterProtocol
    }
    
    public required init(presenter: ApplicationsListPresenterProtocol) {
        super.init(presenter: presenter)
        
        presenter.delegate = WeakWrapper(self)
    }
    
    // MARK: ApplicationsListPresenterDelegate
    
    public func presenter(_ presenter: ApplicationsListPresenterProtocol, requestNavigateToApplicationDetailsScreenWith application: MemberVerificationApplication) throws {
        try handle(action: PushDetailsScreenAction(application: application))
    }
    
}
