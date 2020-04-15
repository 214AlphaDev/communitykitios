//
//  SignUpPresenter.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/25/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

public class SignUpPresenter: SignUpPresenterProtocol {
    
    public let view: SignUpViewProtocol
    let loginService: LoginServiceProtocol
    public var delegate: WeakWrapper<SignUpPresenterDelegate> = WeakWrapper()
    var creatingMember: CreatingMember = CreatingMember(username: nil, firstName: "", lastName: "", emailAddress: nil, profilePicture: nil)
    
    public init(view: SignUpViewProtocol, loginService: LoginServiceProtocol) {
        self.view = view
        self.loginService = loginService
        view.presenter = WeakWrapper(self)
        updateSubmitButton()
    }
    
    func updateSubmitButton() {
        let isCorrectMemberInput = (try? creatingMember.convertToSignUpData()) != nil
        view.setSubmitButtonEnabled(isCorrectMemberInput)
    }
    
    // MARK: SignUpPresenterProtocol methods
    
    public func setProfilePicture(_ image: UIImage) {
        self.creatingMember.profilePicture = try? ProfilePicture(image)
        updateSubmitButton()
    }
    
    public func setUsername(_ username: String) {
        self.creatingMember.username = try? Username(username)
        updateSubmitButton()
    }
    
    public func setFirstName(_ firstName: String) {
        self.creatingMember.firstName = firstName
        updateSubmitButton()
    }
    
    public func setLastName(_ lastName: String) {
        self.creatingMember.lastName = lastName
        updateSubmitButton()
    }
    
    public func setEmailAddress(_ emailAddress: String) {
        self.creatingMember.emailAddress = try? EmailAddress(emailAddress)
        updateSubmitButton()
    }
    
    public func clearProfilePicture() {
        self.creatingMember.profilePicture = nil
    }
    
    public func submit() {
        do {
            let signUpData = try creatingMember.convertToSignUpData()
            self.loginService.signUp(signUpData) { [weak self] response in
                guard let self = self else {
                    return
                }
                
                switch response {
                case .failure(let error):
                    self.view.displayError(title: "Error", error: error)
                case .success(let member):
                    self.requestLogin(emailAddress: member.emailAddress)
                }
            }
        } catch {
            view.displayError(title: "Error", error: error)
        }
    }
    
    func requestLogin(emailAddress: EmailAddress) {
        self.loginService.requestLogin(emailAddress: emailAddress) { [weak self] response in
            guard let self = self else {
                return
            }
            
            do {
                switch response {
                case .success(_):
                    try self.delegate.wrapped?.presenter(self, requestedNavigateToConfirmationWithEmailAddress: emailAddress)
                case .failure(let error):
                    throw error
                }
            } catch {
                self.view.displayError(title: "Error", error: error)
            }
        }
    }
    
    public func cleanUp() {
        view.cleanUp()
    }
    
    // MARK: Validation
    
    public func validate(field: SignUpValidationField) -> ValidationResult {
        switch field {
        case .emailAddress(let emailAddress):
            return EmailAddress.validateEmailAddress(emailAddress)
        case .firstName(let firstName):
            return ProperName.validateFirstName(firstName)
        case .lastName(let lastName):
            return ProperName.validateLastName(lastName)
        case .username(let username):
            return Username.validateUsername(username)
        }
    }
    
    public var viewController: UIViewController {
        return view.viewController
    }
    
}
