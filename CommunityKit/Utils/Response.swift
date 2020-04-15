//
//  Response.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/28/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

public enum Response<T> {
    case failure(Error)
    case success(T)
}
