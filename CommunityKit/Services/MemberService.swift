//
//  MemberService.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/31/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

public class MemberService: MemberServiceProtocol {

    let memberRepository: MemberRepositoryProtocol
    let memberBackend: MemberBackendProtocol
    let accessMaterial: AccessMaterial
    
    public init(accessMaterial: AccessMaterial, memberBackend: MemberBackendProtocol, memberRepository: MemberRepositoryProtocol) {
        self.accessMaterial = accessMaterial
        self.memberBackend = memberBackend
        self.memberRepository = memberRepository
    }
    
    public func getCurrentMember() throws -> Member? {
        return try memberRepository.get(id: accessMaterial.accessToken.subject)
    }
    
    public func fetchCurrentMember(callback: @escaping (Response<Member>) -> Void) {
        memberBackend.currentMember { [weak self] response in
            guard let self = self else {
                callback(.failure(ResponseError.unknownError))
                return
            }
            
            switch response {
            case .success(let member):
                try? self.memberRepository.persist(member: member)
            case .failure(_):
                break
            }
            callback(response)
        }
    }
  
    public func get(id: UUIDV4) throws -> Member? {
        return try memberRepository.get(id: id)
    }
    
    public func persist(member: Member) throws {
        try memberRepository.persist(member: member)
    }
    
}

