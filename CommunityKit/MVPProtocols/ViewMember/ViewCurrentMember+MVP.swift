//
//  ViewCurrentMember+MVP.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 4/2/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

public protocol ViewCurrentMemberPresenterDelegate: class {
    func presenterRequestLogout(_ presenter: ViewCurrentMemberPresenterProtocol) throws
}

public protocol ViewCurrentMemberPresenterProtocol: Presenter {
    var view: ViewCurrentMemberViewProtocol { get }
    var delegate: WeakWrapper<ViewCurrentMemberPresenterDelegate> { get set }
    
    func logout()
}

public protocol ViewCurrentMemberViewProtocol: class, ViewControllerProvider, ErrorDisplayable, LoadingIndicatorDisplayable {
    var presenter: WeakWrapper<ViewCurrentMemberPresenterProtocol> { get set }
    
    func update(with member: Member)
}
