//
//  MemberVerificationFlow.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/30/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

public class MemberVerificationCompletedAction: Action {}
typealias PopStatusScreenAction = PopAction<MemberVerificationStatusFlowProtocol>

class PushMemberVerificationStatusScreenAction: Action {
    let application: MemberVerificationApplication
    let animated: Bool
    
    init(application: MemberVerificationApplication, animated: Bool) {
        self.application = application
        self.animated = animated
    }
}

public struct MemberVerificationFlowFactory {
    
    public static func build(
        navigationController: UINavigationController,
        sendMemberVerificationFlow: SendMemberVerificationFlowProtocol,
        memberVerificationStatusFlowFactory: @escaping (MemberVerificationApplication) -> MemberVerificationStatusFlowProtocol,
        memberVerificationService: MemberVerificationServiceProtocol) -> MemberVerificationFlowProtocol {
        let builder = FlowBuilder(rootFlow: MemberVerificationFlow(
            navigationController: navigationController,
            memberVerificationService: memberVerificationService,
            sendMemberVerificationFlow: sendMemberVerificationFlow
        ))
        
        return builder
            .on(PushMemberVerificationStatusScreenAction.self) { flow, action in
                if !(flow.topFlow is MemberVerificationStatusFlowProtocol) {
                    flow.pushFlow(memberVerificationStatusFlowFactory(action.application), animated: action.animated)
                }
            }
            .on(PopStatusScreenAction.self) { flow, action in
                if flow.topFlow is MemberVerificationStatusFlowProtocol {
                    flow.popFlow()
                }
            }
            .rootFlow
    }
    
}

public protocol MemberVerificationFlowProtocol: Flow {}

public class MemberVerificationFlow: PushPopNavigationFlow, MemberVerificationFlowProtocol {
    
    let memberVerificationService: MemberVerificationServiceProtocol
    var sendMemberVerificationFlow: SendMemberVerificationFlowProtocol {
        return rootFlow as! SendMemberVerificationFlowProtocol
    }
    
    init(navigationController: UINavigationController,
         memberVerificationService: MemberVerificationServiceProtocol,
         sendMemberVerificationFlow: SendMemberVerificationFlowProtocol) {
        self.memberVerificationService = memberVerificationService
        
        super.init(navigationController: navigationController, rootFlow: sendMemberVerificationFlow)
    }
    
    public override func prepareToStart() {
        super.prepareToStart()
        
        var memberVerificationApplication: MemberVerificationApplication?
        do {
            memberVerificationApplication = try memberVerificationService.getCurrentApplication()
        } catch {
            memberVerificationApplication = nil
        }
        
        if let application = memberVerificationApplication {
            DispatchQueue.main.async {
                self.showCorrectScreen(for: application)
            }
            return
        }
        
        sendMemberVerificationFlow.presenter.view.setLoadingIndicatorVisible(true)
        
        memberVerificationService.fetchCurrentApplication { [weak self] response in
            guard let self = self else { return }
            
            self.sendMemberVerificationFlow.presenter.view.setLoadingIndicatorVisible(false)
            switch response {
            case .failure(let error):
                self.sendMemberVerificationFlow.presenter.view.displayError(title: "Error", error: error)
            case .success(let application):
                self.showCorrectScreen(for: application)
            }
        }
    }
    
    func showCorrectScreen(for memberVerificationApplication: MemberVerificationApplication?) {
        guard let application = memberVerificationApplication else {
            return
        }
        
        do {
            switch application.state {
            case .approved:
                try handle(action: MemberVerificationCompletedAction())
                return
            case .rejected:
                try handle(action: PopStatusScreenAction())
            case .pending:
                try handle(action: PushMemberVerificationStatusScreenAction(application: application, animated: false))
            }
        } catch {
            sendMemberVerificationFlow.presenter.view.displayError(title: "Error", error: error)
        }
    }
    
}
