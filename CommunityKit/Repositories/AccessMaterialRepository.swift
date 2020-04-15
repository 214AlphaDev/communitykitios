//
//  AccessMaterialRepository.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/28/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import KeychainAccess

public class AccessMaterialRepository: AccessMaterialRepositoryProtocol {
    
    private let accessMaterialKey = "access-material"
    private let keychain: Keychain
    
    public init(keyChain: Keychain) {
        self.keychain = keyChain
    }
    
    public func getAccessMaterial() throws -> AccessMaterial? {
        
        guard let accessMaterialStr = try self.keychain.get(self.accessMaterialKey) else {
            return nil
        }
    
        let items = accessMaterialStr.components(separatedBy: "~")
        
        let accessToken = items[0]
        let base64KeyPairSeed = items[1]
        
        guard let memberAccessKeyPairSeed = Data(base64Encoded: base64KeyPairSeed) else {
            return nil
        }
        
        let memberAccessKeyPair = MemberAccessKeyPair(seed: Array(memberAccessKeyPairSeed))
        
        return AccessMaterial(accessToken: try AccessToken(jwtString: accessToken), memberAccessKeyPair: memberAccessKeyPair)

    }
    
    public func persist(accessMaterial: AccessMaterial) throws {
        
        let accesstoken = accessMaterial.accessToken.rawAccessToken
        let keyPairSeed = Data(bytes: accessMaterial.memberAccessKeyPair.keyPairSeed())

        try keychain.set("\(accesstoken)~\(keyPairSeed.base64EncodedString())", key: self.accessMaterialKey)
        
    }
    
    public func clearAccessMaterial() throws {
        try keychain.remove(accessMaterialKey)
    }
    
}
