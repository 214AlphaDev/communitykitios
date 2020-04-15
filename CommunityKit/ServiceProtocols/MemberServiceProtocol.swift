//
//  MemberServiceProtocol.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/31/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

public protocol MemberServiceProtocol {
    
    func getCurrentMember() throws -> Member?
    func fetchCurrentMember(callback: @escaping (Response<Member>) -> Void)
    func get(id: UUIDV4) throws -> Member?
    func persist(member: Member) throws
    
}
