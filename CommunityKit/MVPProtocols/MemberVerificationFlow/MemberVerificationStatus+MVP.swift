//
//  MemberVerificationStatus+MVP.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/29/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

public protocol MemberVerificationStatusPresenterDelegate: class {
    func presenterRequestedNavigationToMainApp(_ presenter: MemberVerificationStatusPresenterProtocol) throws
    
    func presenterRequestedNavigationToSendApplication(_ presenter: MemberVerificationStatusPresenterProtocol) throws
}

public protocol MemberVerificationStatusPresenterProtocol: Presenter {
    var view: MemberVerificationStatusViewProtocol { get }
    var delegate: WeakWrapper<MemberVerificationStatusPresenterDelegate> { get set }
    
    /// Function to call when application is rejected and user wants to create another one
    func goToSendApplication()
    func goToMainApp()
    func updateStatus()
}

public protocol MemberVerificationStatusViewProtocol: class, ViewControllerProvider, ErrorDisplayable, LoadingIndicatorDisplayable {
    var presenter: WeakWrapper<MemberVerificationStatusPresenterProtocol> { get set }
    
    func showApplicationState(_ state: MemberVerificationApplication.State)
}
