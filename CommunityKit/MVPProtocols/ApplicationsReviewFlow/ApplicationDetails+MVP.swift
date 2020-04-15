//
//  ApplicationDetails+MVP.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/31/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

public protocol ApplicationDetailsPresenterDelegate: class {
    func presenterRequestedNavigationToApplicationsList(_ presenter: ApplicationDetailsPresenterProtocol) throws
}

public protocol ApplicationDetailsPresenterProtocol: Presenter {
    var view: ApplicationDetailsViewProtocol { get }
    var delegate: WeakWrapper<ApplicationDetailsPresenterDelegate> { get set }
    
    func rejectApplication(reason: String)
    func approveApplication()
}

public protocol ApplicationDetailsViewProtocol: class, ViewControllerProvider, ErrorDisplayable, LoadingIndicatorDisplayable {
    var presenter: WeakWrapper<ApplicationDetailsPresenterProtocol> { get set }
    
    func showApplication(_ applicationViewData: MemberApplicationViewData)
}
