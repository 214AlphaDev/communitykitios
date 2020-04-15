//
//  LandingPage+MVP.swift
//  CommunityKit
//
//  Created by Florian on 20.03.19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

public protocol LandingPagePresenterDelegate: class {
    func presenterRequestedNavigateToLogin(_ presenter: LandingPagePresenterProtocol) throws
    func presenterRequestedNavigateToSignUp(_ presenter: LandingPagePresenterProtocol) throws
}


public protocol LandingPagePresenterProtocol: Presenter {
    var view: LandingPageViewProtocol { get }
    var delegate: WeakWrapper<LandingPagePresenterDelegate> { get set }
    
    func goToLogin()
    func goToSignUp()
}

public protocol LandingPageViewProtocol: class, ErrorDisplayable, ViewControllerProvider {
    
    var presenter: WeakWrapper<LandingPagePresenterProtocol> { get set }
    
}

