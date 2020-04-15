//
//  ApplicationDetailsPresenter.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/31/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

public class ApplicationDetailsPresenter: ApplicationDetailsPresenterProtocol {
    
    public let view: ApplicationDetailsViewProtocol
    public var delegate: WeakWrapper<ApplicationDetailsPresenterDelegate> = WeakWrapper()
    let applicationsReviewService: ApplicationsReviewServiceProtocol
    let memberService: MemberServiceProtocol
    let memberVerificationApplication: MemberVerificationApplication

    public init(view: ApplicationDetailsViewProtocol, memberVerificationApplication: MemberVerificationApplication, applicationsReviewService: ApplicationsReviewServiceProtocol, memberService: MemberServiceProtocol) {
        self.view = view
        self.memberVerificationApplication = memberVerificationApplication
        self.memberService = memberService
        self.applicationsReviewService = applicationsReviewService
        
        view.presenter = WeakWrapper(self)
        
        do {
            let member = try memberService.get(id: memberVerificationApplication.memberId)
            view.showApplication(MemberApplicationViewData(application: memberVerificationApplication, member: member!))
        } catch {
            view.displayError(title: "Error", error: error)
        }
    }
    
    // MARK: SendMemberVerificationPresenterProtocol
    
    public func rejectApplication(reason: String) {
        view.setLoadingIndicatorVisible(true)
        applicationsReviewService.rejectApplication(id: memberVerificationApplication.id, rejectionReason: reason) { [weak self] response in
            guard let self = self else {
                return
            }
            
            self.view.setLoadingIndicatorVisible(false)
            
            do {
                switch response {
                case .failure(let error):
                    throw error
                case .success(_):
                    try self.delegate.wrapped?.presenterRequestedNavigationToApplicationsList(self)
                }
            } catch {
                self.view.displayError(title: "Error", error: error)
            }
        }
    }
    
    public func approveApplication() {
        view.setLoadingIndicatorVisible(true)
        applicationsReviewService.approveApplication(id: memberVerificationApplication.id) { [weak self] response in
            guard let self = self else {
                return
            }
            
            self.view.setLoadingIndicatorVisible(false)
            
            do {
                switch response {
                case .failure(let error):
                    throw error
                case .success(_):
                    try self.delegate.wrapped?.presenterRequestedNavigationToApplicationsList(self)
                }
            } catch {
                self.view.displayError(title: "Error", error: error)
            }
        }
    }
    
    public var viewController: UIViewController {
        return view.viewController
    }
    
}
