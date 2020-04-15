//
//  MemberVerificationApplication+GraphQL.swift
//  CommunitySDK
//
//  Created by Andrii Selivanov on 3/18/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

extension MemberVerificationApplication {
    
    init(output: MyCurrentApplicationQuery.Data.MyCurrentApplication) throws {
        var state: MemberVerificationApplication.State
        switch output.state {
        case .__unknown(_):
            throw ResponseError.unknownMembershipApplicationState
        case .approved:
            guard let approvedAt = output.approvedAt, let approvedAtDate = TimeConverter.convertToDate(timeString: approvedAt) else {
                throw ResponseError.noApprovedAtDate
            }
            state = .approved(approvedAt: approvedAtDate)
        case .rejected:
            guard let rejectedAt = output.rejectedAt, let rejectedAtDate = TimeConverter.convertToDate(timeString: rejectedAt) else {
                throw ResponseError.noRejectedAtDate
            }
            state = .rejected(rejectedAt: rejectedAtDate, rejectionReason: output.rejectionReason)
        case .pending:
            state = .pending
        }
        
        guard let createdAtDate = TimeConverter.convertToDate(timeString: output.createdAt) else {
            throw ResponseError.invalidCreatedAtDate
        }
        
        self = MemberVerificationApplication(id: try UUIDV4(output.id), applicationText: try MemberVerificationApplicationText(output.applicationText), state: state, createdAt: createdAtDate, memberId: try UUIDV4(output.member.id))
    }
    
    init(output: ApplyForVerificationMutation.Data.ApplyForVerification.Application) throws {
        var state: MemberVerificationApplication.State
        switch output.state {
        case .__unknown(_):
            throw ResponseError.unknownMembershipApplicationState
        case .approved:
            guard let approvedAt = output.approvedAt, let approvedAtDate = TimeConverter.convertToDate(timeString: approvedAt) else {
                throw ResponseError.noApprovedAtDate
            }
            state = .approved(approvedAt: approvedAtDate)
        case .rejected:
            guard let rejectedAt = output.rejectedAt, let rejectedAtDate = TimeConverter.convertToDate(timeString: rejectedAt) else {
                throw ResponseError.noRejectedAtDate
            }
            state = .rejected(rejectedAt: rejectedAtDate, rejectionReason: output.rejectionReason)
        case .pending:
            state = .pending
        }
        
        guard let createdAtDate = TimeConverter.convertToDate(timeString: output.createdAt) else {
            throw ResponseError.invalidCreatedAtDate
        }
        
        self = MemberVerificationApplication(id: try UUIDV4(output.id), applicationText: try MemberVerificationApplicationText(output.applicationText), state: state, createdAt: createdAtDate, memberId: try UUIDV4(output.member.id))
    }
    
}
