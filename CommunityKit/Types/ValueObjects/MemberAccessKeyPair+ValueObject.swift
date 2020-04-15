//
//  MemberAccessKeyPair+ValueObject.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/27/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import Sodium

public struct MemberAccessKeyPair {
    
    private let publicKey : Bytes
    private let secretKey: Bytes
    private let seed: Bytes
    
    static func factory() -> MemberAccessKeyPair {
        let sodium = Sodium()
        return MemberAccessKeyPair(seed: sodium.randomBytes.buf(length: sodium.sign.SeedBytes)!)
    }
    
    init(seed: Bytes) {
        let keyPair = Sodium().sign.keyPair(seed: seed)
        self.publicKey = keyPair!.publicKey
        self.secretKey = keyPair!.secretKey
        self.seed = seed
    }
    
    func keyPairSeed() -> Bytes {
        return self.seed
    }
    
    func hexPublicKey() -> String {
        return publicKey.map { String(format: "%02x", $0) }.joined()
    }
    
}
