//
//  UserDefaultsKeysTests.swift
//
//
//  Created by 葦沢尚也 on 2022/09/19.
//

import XCTest
@testable import EasyUserDefaults

class UserDefaultsKeysTests: XCTestCase {

    func testKeys() {
        let mockKey = MockUserDefaultsKeys.test
        XCTAssertEqual(mockKey.keyValue, "test")
    }
}
