//
//  MemberRepositoryTest.swift
//  CommunityKitTests
//
//  Created by Florian on 29.03.19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import XCTest
import RealmSwift
@testable import CommunityKit

class MemberRepositoryTest: XCTestCase {

    private func tmpRealmDatabase() throws -> Realm {
        
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
        return try Realm(configuration: realmConfig)
        
    }
    
    func testPersistWithoutProfilePicture() {
        
        // test database
        let db = try! self.tmpRealmDatabase()
        
        // member repository
        let memberRepository = MemberRepository(db: db)
        
        // member data
        let memberID = try! UUIDV4("cda4072c-8d30-434c-b925-9b10eec16ade")
        let properName = try! ProperName(firstName: "Hans", lastName: "Peter")
        let username = try! Username("hans_peter")
        let emailAddress = try! EmailAddress("hans@peter.org")
        
        // persist member
        try! memberRepository.persist(member: Member(
            id: memberID,
            properName: properName,
            username: username,
            profilePicture: nil,
            emailAddress: emailAddress,
            isAdmin: true
        ))
        
        // fetch member
        let fetchedMember = db.objects(MemberModel.self).first!
        
        // assertions on member
        XCTAssertTrue(fetchedMember.admin)
        XCTAssertEqual(fetchedMember.username, "hans_peter")
        XCTAssertEqual(fetchedMember.emailAddress, "hans@peter.org")
        XCTAssertEqual(fetchedMember.firstName, "Hans")
        XCTAssertEqual(fetchedMember.lastName, "Peter")
        XCTAssertEqual(fetchedMember.id, "cda4072c-8d30-434c-b925-9b10eec16ade")
        XCTAssertNil(fetchedMember.profilePicture)
        
    }
    
    func testReturnNilIfThereIsNoMemberForId() {
        
        // test database
        let db = try! self.tmpRealmDatabase()
        
        // member repository
        let memberRepository = MemberRepository(db: db)
        
        // try to fetch member that isn't supposed to exist
        let memberID = try! UUIDV4("125a05ec-6e49-4716-8ce9-b895e3cc7680")
        let fetchedMember = try! memberRepository.get(id: memberID)
        
        // ensure that fetched member is nil
        XCTAssertNil(fetchedMember)
        
    }
    
    func testReturnPersistedMember() {
        
        // test database
        let db = try! self.tmpRealmDatabase()
        
        // member data
        let memberID = try! UUIDV4("351f3f29-9a26-413c-a447-5fa6fe546d8d")
        let properName = try! ProperName(firstName: "Hans", lastName: "Peter")
        let username = try! Username("hans_peter")
        let emailAddress = try! EmailAddress("hans@peter.org")
        
        // persist dummy test member
        try! db.write {
            let m = MemberModel()
            m.id = "first_member"
            db.add(m)
        }
        
        // persist test member
        try! db.write {
            let m = MemberModel()
            
            m.admin = true
            m.id = String(describing: memberID)
            m.firstName = properName.firstName
            m.lastName = properName.lastName
            m.emailAddress = emailAddress.emailAddress
            m.username = username.username
            
            db.add(m)
        }
        
        // persist another dummy test member
        try! db.write {
            let m = MemberModel()
            m.id = "first_member"
            db.add(m)
        }
        
        // member repository
        let memberRepository = MemberRepository(db: db)
        
        // fetch member by id
        let m = try! memberRepository.get(id: memberID)
        guard let fetchedMember = m else {
            XCTFail("failed to fetch member")
            return
        }
        
        // ensure the data is as we expect it to be
        XCTAssertTrue(fetchedMember.isAdmin)
        XCTAssertEqual(String(describing: fetchedMember.username), "hans_peter")
        XCTAssertEqual(String(describing: fetchedMember.emailAddress), "hans@peter.org")
        XCTAssertEqual(fetchedMember.properName.firstName, "Hans")
        XCTAssertEqual(fetchedMember.properName.lastName, "Peter")
        XCTAssertEqual(String(describing: fetchedMember.id), "351f3f29-9a26-413c-a447-5fa6fe546d8d")
        XCTAssertNil(fetchedMember.profilePicture)
        
    }
    
}
