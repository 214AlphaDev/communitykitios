//
//  MemberRepositoryProtocol.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/29/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

public protocol MemberRepositoryProtocol {
    func persist(member: Member) throws
    func get(id: UUIDV4) throws -> Member?
}
