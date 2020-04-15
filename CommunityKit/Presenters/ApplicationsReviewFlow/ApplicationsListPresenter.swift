//
//  ApplicationsListPresenter.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/31/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

public class ApplicationsListPresenter: ApplicationsListPresenterProtocol {
    
    public let view: ApplicationsListViewProtocol
    public var delegate: WeakWrapper<ApplicationsListPresenterDelegate> = WeakWrapper()
    let applicationsReviewService: ApplicationsReviewServiceProtocol
    let memberService: MemberServiceProtocol
    
    public init(view: ApplicationsListViewProtocol, applicationsReviewService: ApplicationsReviewServiceProtocol, memberService: MemberServiceProtocol) {
        self.view = view
        self.applicationsReviewService = applicationsReviewService
        self.memberService = memberService
        view.presenter = WeakWrapper(self)
        
        updateApplications()
    }
    
    func updateApplications() {
        guard let applications = try? applicationsReviewService.getAllApplications() else {
            return
        }
        
        let pendingApplications = applications.filter {
            if case .pending = $0.state {
                return true
            }
            
            return false
        }
        
        let viewData = pendingApplications.map {
            return MemberApplicationViewData(application: $0, member: try! memberService.get(id: $0.memberId)!)
        }
        
        view.showApplications(viewData)
    }
    
    // MARK: SendMemberVerificationPresenterProtocol
    
    public func openDetails(for application: MemberVerificationApplication) {
        do {
            try self.delegate.wrapped?.presenter(self, requestNavigateToApplicationDetailsScreenWith: application)
        } catch {
            view.displayError(title: "Error", error: error)
        }
    }
    
    public func fetchApplications() {
        view.setLoadingIndicatorVisible(true)
        applicationsReviewService.fetchApplications(fromId: nil, count: 100, state: .pending) { [weak self] response in
            guard let self = self else {
                return
            }
            
            self.view.setLoadingIndicatorVisible(false)
            switch response {
            case .failure(let error):
                self.view.displayError(title: "Error", error: error)
            case .success(_):
                self.updateApplications()
            }
        }
    }
    
    public func reloadApplications() {
        updateApplications()
    }
    
    public var viewController: UIViewController {
        return view.viewController
    }
    
}
