//
//  ApplicationsReviewService.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 4/1/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

public class ApplicationsReviewService: ApplicationsReviewServiceProtocol {
    
    let memberVerificationApplicationRepository: MemberVerificationApplicationRepositoryProtocol
    let memberRepository: MemberRepositoryProtocol
    let applicationsReviewBackend: ApplicationsReviewBackendProtocol
    let accessMaterial: AccessMaterial
    
    public init(accessMaterial: AccessMaterial,
                applicationsReviewBackend: ApplicationsReviewBackendProtocol,
                memberRepository: MemberRepositoryProtocol,
                memberVerificationApplicationRepository: MemberVerificationApplicationRepositoryProtocol) {
        self.accessMaterial = accessMaterial
        self.applicationsReviewBackend = applicationsReviewBackend
        self.memberRepository = memberRepository
        self.memberVerificationApplicationRepository = memberVerificationApplicationRepository
    }
    
    public func getApplication(id: UUIDV4) throws -> MemberVerificationApplication? {
        return try memberVerificationApplicationRepository.get(id: id)
    }
    
    public func getAllApplications() throws -> [MemberVerificationApplication] {
        return try memberVerificationApplicationRepository.getAll()
    }
    
    public func getAplications(fromId: UUIDV4?, count: Int, state: MemberVerificationApplication.State) throws -> [MemberVerificationApplication] {
        return try memberVerificationApplicationRepository.get(fromId: fromId, count: count, state: state)
    }
    
    public func fetchApplications(fromId: UUIDV4?, count: Int, state: MemberVerificationApplication.State, callback: @escaping (Response<[MemberVerificationApplication]>) -> Void) {
        applicationsReviewBackend.applications(from: fromId, count: count, state: state) { [weak self] response in
            switch response {
            
            case .success(let applications):
                do {
                    try applications.forEach { dataPair in
                        let (application, member) = dataPair
                        try self?.saveMember(member: member)
                        try self?.saveApplication(application: application)
                    }
                    callback(.success(applications.map { $0.0 }))
                } catch {
                    callback(.failure(PersistenceError.applicationPersistenceFailed(underlyingError: error)))
                }
            case .failure(let error):
                callback(.failure(error))
            }
            
        }
    }
    
    public func approveApplication(id: UUIDV4, callback: @escaping (Response<MemberVerificationApplication>) -> Void) {
        applicationsReviewBackend.approveApplication(with: id) { [weak self] response in
            self?.handleApplicationResponse(response, callback: callback)
        }
    }
    
    public func rejectApplication(id: UUIDV4, rejectionReason: String, callback: @escaping (Response<MemberVerificationApplication>) -> Void) {
        applicationsReviewBackend.rejectApplication(with: id, reason: rejectionReason) { [weak self] response in
            self?.handleApplicationResponse(response, callback: callback)
        }
    }
    
    func handleApplicationResponse(_ response: Response<MemberVerificationApplication>, callback: @escaping (Response<MemberVerificationApplication>) -> Void) {
        if case .success(let application) = response {
            do {
                try self.saveApplication(application: application)
            } catch {
                callback(.failure(PersistenceError.applicationPersistenceFailed(underlyingError: error)))
            }
        }
        
        callback(response)
    }
    
    func saveMember(member: Member) throws {
        try memberRepository.persist(member: member)
    }
    
    func saveApplication(application: MemberVerificationApplication) throws {
        try memberVerificationApplicationRepository.persist(application: application)
    }
    
    
}

