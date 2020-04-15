//
//  RequestLoginPresenter.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/25/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

public class RequestLoginPresenter: RequestLoginPresenterProtocol {
    
    public let view: RequestLoginViewProtocol
    let loginService: LoginServiceProtocol
    var emailAddress: EmailAddress? = nil
    public var delegate: WeakWrapper<RequestLoginPresenterDelegate> = WeakWrapper()
    
    public init(view: RequestLoginViewProtocol, loginService: LoginServiceProtocol) {
        self.view = view
        self.loginService = loginService
        view.presenter = WeakWrapper(self)
        
        view.setRequestConfirmationCodeButtonEnabled(false)
    }
    
    public func requestConfirmationCode() {
        guard let emailAddress = self.emailAddress else {
            view.displayError(title: "Error", error: ValidationError.invalidEmailAddress)
            return
        }
        
        loginService.requestLogin(emailAddress: emailAddress) { [weak self] response in
            guard let self = self else { return }
            
            do {
                switch response {
                case .success(_):
                    try self.delegate.wrapped?.presenter(self, requestedNavigateToLoginConfirmationWithEmailAddress: emailAddress)
                case .failure(let error):
                    throw error
                }
            } catch {
                self.view.displayError(title: "Error", error: error)
            }
        }
    }
    
    public func setEmailAddress(_ emailAddress: String) {
        do {
            self.emailAddress = try EmailAddress(emailAddress)
            view.setRequestConfirmationCodeButtonEnabled(true)
        } catch {
            view.setRequestConfirmationCodeButtonEnabled(false)
        }
    }
    
    public func cleanUp() {
        self.emailAddress = nil
        view.cleanUp()
        view.setRequestConfirmationCodeButtonEnabled(false)
    }
    
    // MARK: Validation
    
    public func validate(emailAddress: String) -> ValidationResult {
        return EmailAddress.validateEmailAddress(emailAddress)
    }
    
    public var viewController: UIViewController {
        return view.viewController
    }
    
}
