//
//  ViewCurrentMemberPresenter.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 4/2/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

public class ViewCurrentMemberPresenter: ViewCurrentMemberPresenterProtocol {
    
    public let view: ViewCurrentMemberViewProtocol
    public var delegate: WeakWrapper<ViewCurrentMemberPresenterDelegate> = WeakWrapper()
    let memberService: MemberServiceProtocol
    
    public init(view: ViewCurrentMemberViewProtocol, memberService: MemberServiceProtocol) {
        self.view = view
        self.memberService = memberService
        
        view.presenter = WeakWrapper(self)
        
        do {
            guard let member = try memberService.getCurrentMember() else {
                throw TranslatableError(message: "Current member not found")
            }
            view.update(with: member)
        } catch {
            view.displayError(title: "Error", error: error)
        }
    }
    
    public func logout() {
        do {
            try delegate.wrapped?.presenterRequestLogout(self)
        } catch {
            view.displayError(title: "Error", error: error)
        }
    }
    
    public var viewController: UIViewController {
        return view.viewController
    }
    
}
