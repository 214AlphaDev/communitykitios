//
//  MemberVerificationApplicationRepositoryProtocol.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/30/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

public protocol MemberVerificationApplicationRepositoryProtocol {
    
    func persist(application: MemberVerificationApplication) throws
    func get(id: UUIDV4) throws -> MemberVerificationApplication?
    func getApplications(memberId: UUIDV4) throws -> [MemberVerificationApplication]
    func getAll() throws -> [MemberVerificationApplication]
    func get(fromId: UUIDV4?, count: Int, state: MemberVerificationApplication.State) throws -> [MemberVerificationApplication]
    func remove(id: UUIDV4) throws
    
}
