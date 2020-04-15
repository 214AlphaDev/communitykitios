//
//  MemberVerificationServiceProtocol.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/30/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

public protocol MemberVerificationServiceProtocol {
    
    func getCurrentApplication() throws -> MemberVerificationApplication?
    func fetchCurrentApplication(callback: @escaping (Response<MemberVerificationApplication?>) -> Void)
    func applyForVerification(applicationText: MemberVerificationApplicationText, callback: @escaping (Response<MemberVerificationApplication>) -> Void)
    func clearCurrentApplication() throws
    
}
