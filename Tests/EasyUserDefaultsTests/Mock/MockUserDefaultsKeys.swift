//
//  MockUserDefaultsKeys.swift
//
//
//  Created by 葦沢尚也 on 2022/09/19.
//

import Foundation
@testable import EasyUserDefaults

enum MockUserDefaultsKeys: UserDefaultsKeys {
    case test
    case string

    var keyValue: String {
        switch self {
        case .test:
            return "test"
        case .string:
            return "string"
        }
    }
}
