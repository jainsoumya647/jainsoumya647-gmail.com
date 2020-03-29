//
//  LoginModel.swift
//  McKinley&Rice
//
//  Created by Soumya Jain on 30/03/20.
//  Copyright © 2020 Soumya Jain. All rights reserved.
//

import Foundation

struct Login {
    var id: String = ""
    var password: String = ""
    
    func validateIdAndPassword() -> Bool {
        
        guard !self.id.isEmpty else {
            return false
        }
        
        guard !self.password.isEmpty else {
            return false
        }
        
        return true
    }
}
