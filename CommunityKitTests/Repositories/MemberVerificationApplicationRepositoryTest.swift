//
//  MemberVerificationApplicationRepositoryTest.swift
//  CommunityKitTests
//
//  Created by Florian on 30.03.19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import XCTest
import Quick
import Nimble
import RealmSwift
@testable import CommunityKit

class MemberVerificationApplicationRepositorySpec : QuickSpec {
    override func spec() {
        
        describe("member verification application repository") {
            
            var db : Realm!
            var applicationRepository : MemberVerificationApplicationRepository!
            
            beforeEach {
                
                // generate random key
                var keyData = Data(count: 32)
                let result = keyData.withUnsafeMutableBytes {
                    (mutableBytes: UnsafeMutablePointer<UInt8>) -> Int32 in
                    SecRandomCopyBytes(kSecRandomDefault, 32, mutableBytes)
                }
                
                let dbId = keyData.map { (b) -> String in
                    return String(format: "%02hhx", b)
                }.joined()
                
                var realmConfig = Realm.Configuration()
                realmConfig.inMemoryIdentifier = dbId
                db = try! Realm(configuration: realmConfig)
                applicationRepository = MemberVerificationApplicationRepository(db: db)
            }
            
            context("persist", closure: {
                
                it("should persist approved state", closure: {
                    
                    let approvedAt = Date(timeIntervalSince1970: 20)
                    let createdAt = Date(timeIntervalSince1970: 10)
                    
                    let application = try! MemberVerificationApplication(
                        id: try! UUIDV4("00000001-3fed-4e19-bc3a-887670de994e"),
                        applicationText: MemberVerificationApplicationText("hi, please let me join your community"),
                        state: MemberVerificationApplication.State.approved(approvedAt: approvedAt),
                        createdAt: createdAt,
                        memberId: try! UUIDV4("d4064110-3fed-4e19-bc3a-887670de994e")
                    )
                    
                    try! applicationRepository.persist(application: application)
                    
                    let fetchedApplication = db.objects(MemberVerificationApplicationModel.self).filter("memberId = %@", "d4064110-3fed-4e19-bc3a-887670de994e").first
                    
                    expect(fetchedApplication?.approvedAt).to(equal(approvedAt))
                    expect(fetchedApplication?.createdAt).to(equal(createdAt))
                    expect(fetchedApplication?.applicationText).to(equal("hi, please let me join your community"))
                    expect(fetchedApplication?.state).to(equal("APPROVED"))
                    expect(fetchedApplication?.memberId).to(equal("d4064110-3fed-4e19-bc3a-887670de994e"))
                    
                })
                
                it("should persist rejected state", closure: {
                    fail("missing implementation")
                })
                
                it("should persist pending state", closure: {
                    fail("missing implementation")
                })
                
                it("must update record if it already exists", closure: {
                    fail("missing implementation")
                })
                
            })
            
            context("get", closure: {
                
                it("returns nil if application for member doesn't exist", closure: {
                    let application = try! applicationRepository.get(id: try! UUIDV4("4f474549-25d0-49a5-a2db-05afc8cfeea8"))
                    expect(application).to(beNil())
                })
                
                it("must return approved application", closure: {
                    fail("missing implementation")
                })
                
                it("must returned rejected application", closure: {
                    fail("missing implementation")
                })
                
                it("must returned pending application", closure: {
                    
                    try! db.write {
                        let application = MemberVerificationApplicationModel()
                        application.applicationText = "hi, let me in"
                        application.createdAt = Date(timeIntervalSince1970: 10)
                        application.state = "PENDING"
                        application.id = "f6e22640-d588-433b-9435-74a0c590c344"
                        application.memberId = "d4064110-3fed-4e19-bc3a-887670de994e"
                        db.add(application)
                    }
                    
                    let fetchedApplication = try! applicationRepository.get(id: try! UUIDV4("f6e22640-d588-433b-9435-74a0c590c344"))
                    
                    expect(fetchedApplication?.createdAt).to(equal(Date(timeIntervalSince1970: 10)))
                    expect(fetchedApplication?.applicationText.applicationText).to(equal("hi, let me in"))
                    expect(fetchedApplication?.memberId.description).to(equal("d4064110-3fed-4e19-bc3a-887670de994e"))
                    if case .pending = fetchedApplication!.state {} else {
                        fail("Application state is not saved correctly")
                    }
                })
                
                it("must throw error in case that application state is invalid", closure: {
                    fail("missing implementation")
                })
                
                it("must query by member id", closure: {
                    fail("missing implementation")
                })
                
            })
            
            context("remove", closure: {
                
                it("must delete application", closure: {
                    
                    // test applications
                    let applicationOne = MemberVerificationApplicationModel()
                    applicationOne.id = "11111111-a4f0-4485-b6c4-5b9811d7518e"
                    applicationOne.memberId = "one"
                    
                    let applicationTwo = MemberVerificationApplicationModel()
                    applicationTwo.id = "22222222-a4f0-4485-b6c4-5b9811d7518e"
                    applicationTwo.memberId = "two"
                    
                    let applicationThree = MemberVerificationApplicationModel()
                    applicationThree.id = "33333333-a4f0-4485-b6c4-5b9811d7518e"
                    applicationThree.memberId = "three"
                    
                    // persist applications
                    try! db.write {
                        db.add(applicationOne)
                        db.add(applicationTwo)
                        db.add(applicationThree)
                    }
                    
                    // remove application my member id
                    try! applicationRepository.remove(id: try! UUIDV4("22222222-a4f0-4485-b6c4-5b9811d7518e"))
                    
                    // fetch applications
                    let applications = db.objects(MemberVerificationApplicationModel.self)
                    
                    // we must have two applications since we deleted the second
                    expect(applications).to(haveCount(2))
                    
                    // we should have the applications with id "one" and "three" since we deleted the second application
                    expect(applications[0].memberId).to(be("one"))
                    expect(applications[1].memberId).to(be("three"))
                    
                })
                
            })
            
        }
        
    }
}
