//
//  MemberVerificationService.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/30/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

public class MemberVerificationService: MemberVerificationServiceProtocol {
    
    let memberVerificationApplicationRepository: MemberVerificationApplicationRepositoryProtocol
    let memberVerificationBackend: MemberVerificationBackendProtocol
    let accessMaterial: AccessMaterial
    
    public init(accessMaterial: AccessMaterial, memberVerificationBackend: MemberVerificationBackendProtocol, memberVerificationApplicationRepository: MemberVerificationApplicationRepositoryProtocol) {
        self.accessMaterial = accessMaterial
        self.memberVerificationBackend = memberVerificationBackend
        self.memberVerificationApplicationRepository = memberVerificationApplicationRepository
    }
    
    public func fetchCurrentApplication(callback: @escaping (Response<MemberVerificationApplication?>) -> Void) {
        memberVerificationBackend.myCurrentApplication { [weak self] response in
            guard let self = self else {
                return
            }
            
            if case .success(let memberApplication) = response, let application = memberApplication {
                do {
                try self.memberVerificationApplicationRepository.persist(application: application)
                } catch {
                    callback(.failure(PersistenceError.applicationPersistenceFailed(underlyingError: error)))
                    return
                }
            }
            
            callback(response)
        }
    }
    
    public func getCurrentApplication() throws -> MemberVerificationApplication? {
        let applications = try memberVerificationApplicationRepository.getApplications(memberId: accessMaterial.accessToken.subject)
        return applications.sorted { lhs, rhs in
            if case .orderedAscending = lhs.createdAt.compare(rhs.createdAt) {
                return true
            }
            
            return false
        }.last
    }
    
    public func applyForVerification(applicationText: MemberVerificationApplicationText, callback: @escaping (Response<MemberVerificationApplication>) -> Void) {
        memberVerificationBackend.applyForVerification(applicationText: applicationText) { [weak self] response in
            guard let self = self else {
                callback(.failure(ResponseError.unknownError))
                return
            }
            
            if case .success(let result) = response {
                    try? self.memberVerificationApplicationRepository.persist(application: result)
            }
            callback(response)
        }
    }
    
    public func clearCurrentApplication() throws {
        guard let application = try getCurrentApplication() else {
            return
        }
        
        try memberVerificationApplicationRepository.remove(id: application.id)
    }
    
}

