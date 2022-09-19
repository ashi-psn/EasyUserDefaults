//
//  EasyUserDefaultsErrorTests.swift
//
//
//  Created by 葦沢尚也 on 2022/09/19.
//

import XCTest
@testable import EasyUserDefaults

class EasyUserDefaultsErrorTests: XCTestCase {

    func testLocalizedString() {
        let indexNotFound = EasyUserDefaultsError.indexNotFound
        XCTAssertEqual(indexNotFound.localizedDescription, "index is out range")
    }

}
