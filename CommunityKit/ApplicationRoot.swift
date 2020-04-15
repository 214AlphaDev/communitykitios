//
//  Application.swift
//  CommunityKit
//
//  Created by Florian on 21.03.19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import UIKit
import FlowKit

public class ApplicationRoot: WindowBasedRoot {
    
    let loginService: LoginServiceProtocol
    let loggedOutFlow: LoggedOutFlowProtocol
    var loggedInFlow: LoggedInFlowProtocol?
    let loggedInFlowFactory: (AccessMaterial) -> LoggedInFlowProtocol
    
    public init(loginService: LoginServiceProtocol,
                loggedOutFlow: LoggedOutFlowProtocol,
                loggedInFlowFactory: @escaping (AccessMaterial) -> LoggedInFlowProtocol,
                window: UIWindow) {
        self.loginService = loginService
        self.loggedOutFlow = loggedOutFlow
        self.loggedInFlowFactory = loggedInFlowFactory
        
        super.init(window: window)
    }

    /// Runs the application
    public func boot() {
        do {
            let accessMaterial = try loginService.loggedInMemberAccessMaterial()
            switch accessMaterial {
            case .some(let accessMaterial):
                showLoggedInFlow(accessMaterial: accessMaterial)
            case .none:
                showLoggedOutFlow()
            }
        } catch {
            print("Failed to get access material from login service. Fallback to logged out flow.")
            showLoggedOutFlow()
        }
    }
    
    private func showLoggedOutFlow() {
        showFlow(loggedOutFlow)
    }
    
    private func showLoggedInFlow(accessMaterial: AccessMaterial) {
        let loggedInFlow = loggedInFlowFactory(accessMaterial)
        self.loggedInFlow = loggedInFlow
        showFlow(loggedInFlow)
    }
    
    func logout() throws {
        loggedInFlow = nil
        try loginService.logout()
        showLoggedOutFlow()
    }
    
    public override func handle(action: Action) throws {
        switch action {
        case let loginAction as LoginAction:
            showLoggedInFlow(accessMaterial: loginAction.accessMaterial)
        case is LogoutAction:
            try logout()
        default:
            try super.handle(action: action)
        }
    }
    
}
