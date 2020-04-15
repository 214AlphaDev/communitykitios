//
//  MemberVerificationStatusPresenter.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/30/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

public class MemberVerificationStatusPresenter: MemberVerificationStatusPresenterProtocol {
    
    public let view: MemberVerificationStatusViewProtocol
    public var delegate: WeakWrapper<MemberVerificationStatusPresenterDelegate> = WeakWrapper()
    var memberVerificationApplication: MemberVerificationApplication {
        didSet {
            view.showApplicationState(memberVerificationApplication.state)
        }
    }
    let memberVerificationService: MemberVerificationService
    var lastRefreshDate = Date()
    weak var timer: Timer?
    
    static let updateTimeInterval = 10.0
    static let allowUpdateTimeInterval = 5.0
    
    public init(view: MemberVerificationStatusViewProtocol, application: MemberVerificationApplication, memberVerificationService: MemberVerificationService) {
        self.view = view
        self.memberVerificationApplication = application
        self.memberVerificationService = memberVerificationService
        
        self.timer = Timer.scheduledTimer(withTimeInterval: MemberVerificationStatusPresenter.updateTimeInterval, repeats: true) { [weak self] _ in
            self?.updateStatus()
        }
        
        view.presenter = WeakWrapper(self)
        
        view.showApplicationState(application.state)
    }
    
    // MARK: SendMemberVerificationPresenterProtocol
    
    @objc public func updateStatus() {
        if lastRefreshDate.timeIntervalSinceNow > -MemberVerificationStatusPresenter.allowUpdateTimeInterval {
            return
        }
        view.setLoadingIndicatorVisible(true)
        lastRefreshDate = Date()
        memberVerificationService.fetchCurrentApplication { [weak self]
            response in
            guard let self = self else { return }
            self.view.setLoadingIndicatorVisible(false)
            
            switch response {
            case .failure(let error):
                self.view.displayError(title: "Error", error: error)
            case .success(let memberApplication):
                guard let application = memberApplication else {
                    return
                }
                self.memberVerificationApplication = application
            }
        }
    }
    
    public func goToMainApp() {
        do {
            try delegate.wrapped?.presenterRequestedNavigationToMainApp(self)
        } catch {
            view.displayError(title: "Error", error: error)
        }
    }
    
    public func goToSendApplication() {
        do {
            try delegate.wrapped?.presenterRequestedNavigationToSendApplication(self)
        } catch {
            view.displayError(title: "Error", error: error)
        }
    }
    
    public var viewController: UIViewController {
        return view.viewController
    }
    
}
