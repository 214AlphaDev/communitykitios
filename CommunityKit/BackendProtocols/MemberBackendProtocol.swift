//
//  MemberBackendProtocol.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/31/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

public protocol MemberBackendProtocol {
    
    func currentMember(callback: @escaping (Response<Member>) -> Void)
    
}
