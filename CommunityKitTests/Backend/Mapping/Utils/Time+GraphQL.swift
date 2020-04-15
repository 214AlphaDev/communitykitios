//
//  Time+GraphQL.swift
//  CommunityKitTests
//
//  Created by Andrii Selivanov on 3/31/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import XCTest
@testable import CommunityKit

class Time_GraphQL: XCTestCase {

    func testConvertDate() {
        XCTAssertNotNil(TimeConverter.convertToDate(timeString: "2019-03-31T14:51:49.364068Z"))
    }

}
