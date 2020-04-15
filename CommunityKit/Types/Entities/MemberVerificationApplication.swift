//
//  MemberVerificationApplication.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/29/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

public struct MemberVerificationApplication {
    
    public enum State {
        case rejected(rejectedAt: Date, rejectionReason: String?)
        case approved(approvedAt: Date)
        case pending
    }
    
    public let applicationText: MemberVerificationApplicationText
    public let state: State
    public let createdAt: Date
    public let memberId: UUIDV4
    public let id: UUIDV4
    
    public init(id: UUIDV4, applicationText: MemberVerificationApplicationText, state: State, createdAt: Date, memberId: UUIDV4) {
        self.id = id
        self.applicationText = applicationText
        self.state = state
        self.createdAt = createdAt
        self.memberId = memberId
    }
    
}

