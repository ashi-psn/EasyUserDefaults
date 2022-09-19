//
//  EasyUserDefaultsError.swift
//
//
//  Created by 葦沢尚也 on 2022/09/19.
//

import Foundation

/// EasyUserDefaultsErrors.
enum EasyUserDefaultsError: LocalizedError {
    case indexNotFound

    var errorDescription: String? {
        switch self {
        case .indexNotFound: return "index is out range"
        }
    }
}
