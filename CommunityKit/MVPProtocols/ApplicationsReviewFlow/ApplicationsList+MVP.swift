//
//  ApplicationsList+MVP.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/31/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

public protocol ApplicationsListPresenterDelegate: class {
    func presenter(_ presenter: ApplicationsListPresenterProtocol, requestNavigateToApplicationDetailsScreenWith application: MemberVerificationApplication) throws
}

public protocol ApplicationsListPresenterProtocol: Presenter {
    var view: ApplicationsListViewProtocol { get }
    var delegate: WeakWrapper<ApplicationsListPresenterDelegate> { get set }
    
    func openDetails(for application: MemberVerificationApplication)
    func fetchApplications()
    func reloadApplications()
}

public struct MemberApplicationViewData {
    public let application: MemberVerificationApplication
    public let member: Member
    
    public init(application: MemberVerificationApplication, member: Member) {
        self.application = application
        self.member = member
    }
}

public protocol ApplicationsListViewProtocol: class, ViewControllerProvider, ErrorDisplayable, LoadingIndicatorDisplayable {
    var presenter: WeakWrapper<ApplicationsListPresenterProtocol> { get set }
    
    func showApplications(_ applications: [MemberApplicationViewData])
}
