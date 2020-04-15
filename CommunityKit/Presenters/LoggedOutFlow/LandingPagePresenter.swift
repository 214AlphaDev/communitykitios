//
//  LandingPagePresenter.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/25/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

public class LandingPagePresenter: LandingPagePresenterProtocol {
    
    public let view: LandingPageViewProtocol
    public var delegate: WeakWrapper<LandingPagePresenterDelegate> = WeakWrapper()
    
    public init(view: LandingPageViewProtocol) {
        self.view = view
        view.presenter = WeakWrapper(self)
    }
    
    public func goToLogin() {
        do {
            try delegate.wrapped?.presenterRequestedNavigateToLogin(self)
        } catch {
            self.view.displayError(title: "Error", error: error)
        }
    }
    
    public func goToSignUp() {
        do {
            try delegate.wrapped?.presenterRequestedNavigateToSignUp(self)
        } catch {
            self.view.displayError(title: "Error", error: error)
        }
    }
    
    public var viewController: UIViewController {
        return view.viewController
    }
    
}
