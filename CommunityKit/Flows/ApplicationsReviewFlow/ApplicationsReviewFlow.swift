//
//  ApplicationsReviewFlow.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/31/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

class PushDetailsScreenAction: PushAction<ApplicationDetailsFlowProtocol> {
    let application: MemberVerificationApplication
    
    init(application: MemberVerificationApplication) {
        self.application = application
    }
}

public struct ApplicationsReviewFlowFactory {
    
    public static func build(
        navigationController: UINavigationController,
        applicationListPresenter: ApplicationsListPresenterProtocol,
        applicationDetailsPresenterFactory: @escaping (MemberVerificationApplication) -> ApplicationDetailsPresenterProtocol) -> ApplicationsReviewFlowProtocol {
        let builder = FlowBuilder(rootFlow: ApplicationsReviewFlow(navigationController: navigationController, applicationsListFlow: ApplicationsListFlow(presenter: applicationListPresenter)))
        
        return builder
            .push(on: PushDetailsScreenAction.self) { root, action in
                return ApplicationDetailsFlow(presenter: applicationDetailsPresenterFactory(action.application))
            }
            .on(PopAction<ApplicationDetailsFlowProtocol>.self) { root, action in
                // Reload applications to reflect changes
                root.applicationsListFlow.presenter.reloadApplications()
                
                root.popFlow(animated: true)
            }
            .rootFlow
    }
    
}

public protocol ApplicationsReviewFlowProtocol: Flow {}

public class ApplicationsReviewFlow: PushPopNavigationFlow, ApplicationsReviewFlowProtocol {
    
    var applicationsListFlow: ApplicationsListFlowProtocol {
        return rootFlow as! ApplicationsListFlowProtocol
    }
    
    public init(navigationController: UINavigationController, applicationsListFlow: ApplicationsListFlowProtocol) {
        super.init(navigationController: navigationController, rootFlow: applicationsListFlow)
    }
    
}
