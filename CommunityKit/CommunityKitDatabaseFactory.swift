//
//  CommunityKitDatabase.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/29/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import RealmSwift
import KeychainAccess

public struct CommunityKitDatabaseFactory {
    
    public static func buildDatabase(accessMaterial: AccessMaterial) throws -> Realm {
        let url = Realm.Configuration.defaultConfiguration.fileURL!.deletingLastPathComponent().appendingPathComponent(accessMaterial.accessToken.subject.id)
        
        return try Realm(fileURL: url)
    }
    
    public static func buildKeychain(accessGroup: String) -> Keychain {
        return Keychain(accessGroup: accessGroup)
    }
    
}
