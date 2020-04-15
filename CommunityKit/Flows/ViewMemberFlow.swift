//
//  ViewMemberFlow.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 4/2/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

public protocol ViewMemberFlowProtocol: Flow {}

public class ViewMemberFlow: SingleScreenFlow, ViewMemberFlowProtocol, ViewCurrentMemberPresenterDelegate {
    
    public required init(presenter: ViewCurrentMemberPresenterProtocol) {
        super.init(presenter: presenter)
        
        presenter.delegate = WeakWrapper(self)
    }
    
    // MARK: ViewCurrentMemberPresenterDelegate
    
    public func presenterRequestLogout(_ presenter: ViewCurrentMemberPresenterProtocol) throws {
        try handle(action: LogoutAction())
    }
    
}
