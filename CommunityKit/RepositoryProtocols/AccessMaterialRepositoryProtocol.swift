//
//  AccessMaterialRepositoryProtocol.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/28/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

public protocol AccessMaterialRepositoryProtocol {
    func persist(accessMaterial: AccessMaterial) throws
    func getAccessMaterial() throws -> AccessMaterial?
    func clearAccessMaterial() throws
}
