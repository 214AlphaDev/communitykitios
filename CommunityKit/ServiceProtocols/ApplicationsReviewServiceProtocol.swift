//
//  ApplicationsReviewServiceProtocol.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/31/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

public protocol ApplicationsReviewServiceProtocol {
    
    func getApplication(id: UUIDV4) throws -> MemberVerificationApplication?
    func getAllApplications() throws -> [MemberVerificationApplication]
    func getAplications(fromId: UUIDV4?, count: Int, state: MemberVerificationApplication.State) throws -> [MemberVerificationApplication]
    func fetchApplications(fromId: UUIDV4?, count: Int, state: MemberVerificationApplication.State, callback: @escaping (Response<[MemberVerificationApplication]>) -> Void)
    func approveApplication(id: UUIDV4, callback: @escaping (Response<MemberVerificationApplication>) -> Void)
    func rejectApplication(id: UUIDV4, rejectionReason: String, callback: @escaping (Response<MemberVerificationApplication>) -> Void)
    
}
