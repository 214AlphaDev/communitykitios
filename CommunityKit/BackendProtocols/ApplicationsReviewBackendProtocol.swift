//
//  ApplicationsReviewBackendProtocol.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 4/1/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

public protocol ApplicationsReviewBackendProtocol {
    
    func applications(from id: UUIDV4?, count: Int, state: MemberVerificationApplication.State, callback: @escaping (Response<[(MemberVerificationApplication, Member)]>) -> Void)
    func approveApplication(with id: UUIDV4, callback: @escaping (Response<MemberVerificationApplication>) -> Void)
    func rejectApplication(with id: UUIDV4, reason: String, callback: @escaping (Response<MemberVerificationApplication>) -> Void)
    
}
