//
//  UserDefaults+Extension.swift
//  McKinley&Rice
//
//  Created by Soumya Jain on 30/03/20.
//  Copyright © 2020 Soumya Jain. All rights reserved.
//

import Foundation

protocol BoolUserDefaultable {
    associatedtype BoolDefaultKey : RawRepresentable
}

extension UserDefaults: BoolUserDefaultable {
    enum BoolDefaultKey : String {
        case token
    }
}

extension BoolUserDefaultable where BoolDefaultKey.RawValue == String {
    
    static func set(_ value: Any, forKey key: BoolDefaultKey) {
        let key = key.rawValue
        UserDefaults.standard.setValue(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    static func bool(forKey key: BoolDefaultKey) -> Bool {
        let key = key.rawValue
        return UserDefaults.standard.bool(forKey: key)
    }
    
    static func string(forKey key: BoolDefaultKey) -> String? {
        let key = key.rawValue
        return UserDefaults.standard.string(forKey: key)
    }
    
    static func int(forKey key: BoolDefaultKey) -> Int {
        let key = key.rawValue
        return UserDefaults.standard.integer(forKey: key)
    }
    
    static func remove(for key: BoolDefaultKey) {
        UserDefaults.standard.removeObject(forKey: key.rawValue)
    }
}
