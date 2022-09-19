//
//  UserDefaultsKeys.swift
//  
//
//  Created by 葦沢尚也 on 2022/09/19.
//

import Foundation

/// UserDefaultsKeys
public protocol UserDefaultsKeys: CustomStringConvertible{
    
    /// UserDefaults key for save value.
    var keyValue: String { get }
}

extension UserDefaultsKeys {
    
    /// Default string description value.
    public var description: String {
        keyValue
    }
}
