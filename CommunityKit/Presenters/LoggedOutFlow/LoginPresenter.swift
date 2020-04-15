//
//  LoginPresenter.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/25/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

public class LoginPresenter: LoginPresenterProtocol {
    
    public let view: LoginViewProtocol
    public var delegate: WeakWrapper<LoginPresenterDelegate> = WeakWrapper()
    let loginService: LoginServiceProtocol
    let emailAddress: EmailAddress
    var confirmationCode: ConfirmationCode? = nil
    
    public init(view: LoginViewProtocol, loginService: LoginServiceProtocol, emailAddress: EmailAddress) {
        self.emailAddress = emailAddress
        self.view = view
        self.loginService = loginService
        view.presenter = WeakWrapper(self)
        
        view.setConfirmButtonEnabled(false)
    }
    
    public func setConfirmationCode(_ code: String) {
        do {
            self.confirmationCode = try ConfirmationCode(code)
            view.setConfirmButtonEnabled(true)
        } catch {
            view.setConfirmButtonEnabled(false)
        }
    }
    
    public func resendConfirmationCode() {
        view.setLoadingIndicatorVisible(true)
        loginService.requestLogin(emailAddress: emailAddress) { [weak self] response in
            guard let self = self else { return }
            self.view.setLoadingIndicatorVisible(false)
            switch response {
            case .success(_):
                self.view.showConfirmationCodeSuccessfulSend()
            case .failure(let error):
                self.view.displayError(title: "Error", error: error)
            }
        }
    }
    
    public func confirm() {
        guard let confirmationCode = confirmationCode else {
            return
        }
        
        view.setLoadingIndicatorVisible(true)
        loginService.login(emailAddress: emailAddress, confirmationCode: confirmationCode) { [weak self] response in
            guard let self = self else {
                return
            }
            
            self.view.setLoadingIndicatorVisible(false)
            
            do {
                switch response {
                case .failure(let error):
                    throw error
                case .success(let result):
                    
                    try self.delegate.wrapped?.presenter(self, requestedNavigateToLoggedInFlowWith: result)
                }
            } catch {
                self.view.displayError(title: "Error", error: error)
            }
        }
    }
 
    public func cleanUp() {
        view.cleanUp()
        view.setConfirmButtonEnabled(false)
    }
    
    // MARK: Validation
    
    public func validate(confirmationCode: String) -> ValidationResult {
        return ConfirmationCode.validateCode(confirmationCode)
    }
    
    public var viewController: UIViewController {
        return view.viewController
    }
    
}

