//
//  ApplicationDetailsFlow.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 5/8/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

public protocol ApplicationDetailsFlowProtocol: Flow {}

public class ApplicationDetailsFlow: SingleScreenFlow, ApplicationDetailsFlowProtocol, ApplicationDetailsPresenterDelegate {
    
    public required init(presenter: ApplicationDetailsPresenterProtocol) {
        super.init(presenter: presenter)
        
        presenter.delegate = WeakWrapper(self)
    }
    
    // MARK: ApplicationDetailsPresenterDelegate
    
    public func presenterRequestedNavigationToApplicationsList(_ presenter: ApplicationDetailsPresenterProtocol) throws {
        try handle(action: PopAction<ApplicationDetailsFlowProtocol>())
    }
    
}
