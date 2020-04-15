//
//  LoggedInFlow.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/23/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

class LogoutAction: Action {}

public protocol LoggedInFlowProtocol: Flow {}

public class LoggedInFlow: BaseFlow, LoggedInFlowProtocol {
    
    let memberService: MemberServiceProtocol
    let loadingFlow: Flow
    let mainApplicationFlowFactory: (Member) -> Flow
    var mainApplicationFlow: Flow?
    
    public required init(memberService: MemberServiceProtocol, loadingFlow: Flow, mainApplicationFlowFactory: @escaping (Member) -> Flow) {
        self.memberService = memberService
        self.mainApplicationFlowFactory = mainApplicationFlowFactory
        self.loadingFlow = loadingFlow
        
        super.init()
    }
    
    public override func prepareToStart() {
        super.prepareToStart()
        
        loadingFlow.prepareToStart()
        
        memberService.fetchCurrentMember { [weak self] response in
            guard let self = self else {
                return
            }
            
            switch response {
            case .failure(_):
                try! self.logout()
                return
            case .success(let member):
                self.showMainApplicationFlow(currentMember: member)
            }
        }
    }
    
    func showMainApplicationFlow(currentMember: Member) {
        let applicationFlow = mainApplicationFlowFactory(currentMember)
        mainApplicationFlow = applicationFlow
        
        try? present(applicationFlow, animated: false)
    }
    
    public func logout() throws {
        try handle(action: LogoutAction())
    }
    
    public override func rootViewController() -> UIViewController {
        return loadingFlow.rootViewController()
    }
    
}
