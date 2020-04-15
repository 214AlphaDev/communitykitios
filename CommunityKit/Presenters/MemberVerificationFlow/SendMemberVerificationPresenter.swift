//
//  SendMemberVerificationPresenter.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/30/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

public class SendMemberVerificationPresenter: SendMemberVerificationPresenterProtocol {
    
    public let view: SendMemberVerificationViewProtocol
    public var delegate: WeakWrapper<SendMemberVerificationPresenterDelegate> = WeakWrapper()
    let memberVerificationService: MemberVerificationService
    var memberVerificationApplicationText: MemberVerificationApplicationText?
    
    public init(view: SendMemberVerificationViewProtocol, memberVerificationService: MemberVerificationService) {
        self.view = view
        self.memberVerificationService = memberVerificationService
        view.presenter = WeakWrapper(self)
        
        view.setSubmitButtonEnabled(false)
    }
    
    // MARK: SendMemberVerificationPresenterProtocol
    
    public func setApplicationText(_ text: String) {
        do {
            self.memberVerificationApplicationText = try MemberVerificationApplicationText(text)
            self.view.setSubmitButtonEnabled(true)
        } catch {
            self.view.setSubmitButtonEnabled(false)
        }
    }
    
    public func submit() {
        guard let applicationText = memberVerificationApplicationText else {
            return
        }
        
        view.setLoadingIndicatorVisible(true)
        self.memberVerificationService.applyForVerification(applicationText: applicationText) { [weak self] response in
            guard let self = self else { return }
            
            self.view.setLoadingIndicatorVisible(false)
            do {
                switch response {
                case .failure(let error):
                    throw error
                case .success(let application):
                    try self.delegate.wrapped?.presenter(self, requestNavigateToStatusScreenWith: application)
                }
            } catch {
                self.view.displayError(title: "Error", error: error)
            }
        }
    }
    
    // MARK: Validation
    
    public func validate(applicationText: String) -> ValidationResult {
        return MemberVerificationApplicationText.validateApplicationText(applicationText)
    }
    
    public var viewController: UIViewController {
        return view.viewController
    }
    
}
