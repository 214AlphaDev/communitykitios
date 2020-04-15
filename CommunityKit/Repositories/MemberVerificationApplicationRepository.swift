//
//  MemberVerificationApplicationRepository.swift
//  CommunityKit
//
//  Created by Florian on 30.03.19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import RealmSwift

class MemberVerificationApplicationModel : Object {
    @objc dynamic var applicationText : String = ""
    @objc dynamic var createdAt : Date = Date()
    @objc dynamic var id : String = ""
    @objc dynamic var memberId : String = ""
    @objc dynamic var state : String = ""
    @objc dynamic var approvedAt : Date?
    @objc dynamic var rejectedAt : Date?
    @objc dynamic var rejectionReason : String?
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

public class MemberVerificationApplicationRepository : MemberVerificationApplicationRepositoryProtocol {
    
    let db : Realm
    
    public init(db: Realm) {
        self.db = db
    }
    
    public func persist(application: MemberVerificationApplication) throws {
        
        let a = MemberVerificationApplicationModel()
        a.applicationText = String(describing: application.applicationText)
        a.memberId = String(describing: application.memberId)
        a.createdAt = application.createdAt
        a.id = String(describing: application.id)
        
        switch application.state {
        case .approved(let approvedAt):
            a.approvedAt = approvedAt
            a.state = "APPROVED"
            break
        case .rejected(let rejectedAt, let rejectionReason):
            a.rejectedAt = rejectedAt
            a.rejectionReason = String(describing: rejectionReason)
            a.state = "REJECTED"
            break
        case .pending:
            a.state = "PENDING"
            break
        }
        
        try self.db.write {
            self.db.add(a, update: true)
        }
        
    }
    
    public func get(id: UUIDV4) throws -> MemberVerificationApplication? {
        let application = db.object(ofType: MemberVerificationApplicationModel.self, forPrimaryKey: String(describing: id))
        
        switch application {
        case .none:
            return nil
        case .some(let application):
            return try mapToEntity(model: application)
        }
    }
    
    public func getAll() throws -> [MemberVerificationApplication] {
        // query to get application
        let applicationsQuery = self.db.objects(MemberVerificationApplicationModel.self).sorted(byKeyPath: "createdAt", ascending: false)
        
        return try applicationsQuery.map {
            try mapToEntity(model: $0)
        }
    }
    
    public func get(fromId: UUIDV4?, count: Int, state: MemberVerificationApplication.State) throws -> [MemberVerificationApplication] {
        var fromCreatedAt = Date()
        
        if let startApplicationId = fromId, let fromApplication = db.object(ofType: MemberVerificationApplicationModel.self, forPrimaryKey: String(describing: startApplicationId)) {
            fromCreatedAt = fromApplication.createdAt
        }
        
        let applicationsQuery = self.db.objects(MemberVerificationApplicationModel.self).filter("createdAt <= %@", fromCreatedAt).sorted(byKeyPath: "createdAt", ascending: false)
        
        var result = [MemberVerificationApplication]()
        let lastIndex = max(count, applicationsQuery.count)
        for index in 0..<lastIndex {
            result.append(try mapToEntity(model: applicationsQuery[index]))
        }
        
        return try applicationsQuery.map {
            try mapToEntity(model: $0)
        }
    }
    
    func mapToEntity(model application: MemberVerificationApplicationModel) throws -> MemberVerificationApplication {
        // application state
        let applicationState : MemberVerificationApplication.State
        
        // get right application state
        switch application.state {
        case "APPROVED":
            applicationState = MemberVerificationApplication.State.approved(approvedAt: application.approvedAt!)
        case "REJECTED":
            guard let rejectedAt = application.rejectedAt else {
                throw TranslatableError(message: "rejected at is nil")
            }
            applicationState = MemberVerificationApplication.State.rejected(
                rejectedAt: rejectedAt,
                rejectionReason: application.rejectionReason
            )
        case "PENDING":
            applicationState = MemberVerificationApplication.State.pending
        default:
            throw TranslatableError(message: "invalid state '\(application.state)'")
        }
        
        return MemberVerificationApplication(
            id: try UUIDV4(application.id),
            applicationText: try MemberVerificationApplicationText(application.applicationText),
            state: applicationState,
            createdAt: application.createdAt,
            memberId: try UUIDV4(application.memberId)
        )
    }
    
    public func remove(id: UUIDV4) throws {
        guard let application = db.object(ofType: MemberVerificationApplicationModel.self, forPrimaryKey: String(describing: id)) else {
            return
        }
        
        // delete application
        try self.db.write {
            self.db.delete(application)
        }
        
    }
    
    public func getApplications(memberId: UUIDV4) throws -> [MemberVerificationApplication] {
        let applications = db.objects(MemberVerificationApplicationModel.self).filter("memberId == %@", String(describing: memberId))
        
        return try applications.map {
            try mapToEntity(model: $0)
        }
    }
    
}
