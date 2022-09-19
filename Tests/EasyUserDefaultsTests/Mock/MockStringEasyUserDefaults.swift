//
//  File.swift
//
//
//  Created by 葦沢尚也 on 2022/09/19.
//

import Foundation
@testable import EasyUserDefaults

protocol MockStringEasyUserDefaultsProtocol: EasyUserDefaults where Value == String {}

extension MockStringEasyUserDefaultsProtocol {
    public static var key: UserDefaultsKeys {
        MockUserDefaultsKeys.string
    }
}

public struct MockStringEasyUserDefaults: MockStringEasyUserDefaultsProtocol {}
