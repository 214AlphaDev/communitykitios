//
//  AccessMaterialRepositoryTest.swift
//  CommunityKitTests
//
//  Created by Florian on 30.03.19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import XCTest
import RealmSwift
import KeychainAccess
@testable import CommunityKit

class AccessMaterialRepositoryTest: XCTestCase {

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
    
    func testClearAccessMaterial() {
        
        // database
        let db = try! tmpRealmDatabase()
        
        let keyChain = Keychain(accessGroup: "com.214")
        
        // repository
        let accessMaterialRepo = AccessMaterialRepository(keyChain: keyChain)
        
        // set value for key
        try! keyChain.set("hi", key: "access-material")
        XCTAssertEqual("hi", try! keyChain.get("access-material"))
        
        // clean key store access material slot
        try! accessMaterialRepo.clearAccessMaterial()
        
        // access material slot should be nil
        XCTAssertNil(try! keyChain.get("access-material"))
        
    }

}
