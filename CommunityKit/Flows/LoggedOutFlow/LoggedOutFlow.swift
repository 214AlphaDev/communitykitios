//
//  LoggedOutFlow.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/22/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

typealias PushRequestLoginAction = PushAction<RequestLoginFlowProtocol>
class PushConfirmLoginAction: PushAction<ConfirmLoginFlowProtocol> {
    let emailAddress: EmailAddress
    
    init(emailAddress: EmailAddress) {
        self.emailAddress = emailAddress
    }
}
typealias PushSignUpAction = PushAction<SignUpFlowProtocol>
class LoginAction: Action {
    let accessMaterial: AccessMaterial
    
    init(accessMaterial: AccessMaterial) {
        self.accessMaterial = accessMaterial
    }
}

public protocol LoggedOutFlowProtocol: Flow {}

public struct LoggedOutFlowFactory {
    
    public static func build(
        navigationController: UINavigationController,
        landingPagePresenter: LandingPagePresenterProtocol,
        requestLoginPresenter: RequestLoginPresenterProtocol,
        loginPresenterFactory: @escaping (EmailAddress) -> LoginPresenterProtocol,
        signUpPresenter: SignUpPresenterProtocol) -> LoggedOutFlowProtocol {
        let builder = FlowBuilder(rootFlow: LoggedOutFlow(navigationController: navigationController, landingPageFlow: LandingPageFlow(presenter: landingPagePresenter)))
        
        return builder
            .push(on: PushRequestLoginAction.self) { root, _ in
                return RequestLoginFlow(presenter: requestLoginPresenter)
            }
            .push(on: PushConfirmLoginAction.self) { root, action in
                return ConfirmLoginFlow(presenter: loginPresenterFactory(action.emailAddress))
            }
            .push(on: PushSignUpAction.self) { root, _ in
                return SignUpFlow(presenter: signUpPresenter)
            }
            .pop(RequestLoginFlowProtocol.self)
            .pop(ConfirmLoginFlowProtocol.self)
            .pop(SignUpFlowProtocol.self)
            .rootFlow
    }
    
}

public class LoggedOutFlow: PushPopNavigationFlow, LoggedOutFlowProtocol {
    
    required public init(
        navigationController: UINavigationController,
        landingPageFlow: LandingPageFlowProtocol) {
        super.init(navigationController: navigationController, rootFlow: landingPageFlow)
    }
    
}
