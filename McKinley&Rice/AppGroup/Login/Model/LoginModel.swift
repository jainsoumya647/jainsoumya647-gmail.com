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
            Utility.showOkAlert(message: ErrorMessage.emailEmpty)
            return false
        }
        
        guard self.id.isValidEmail() else {
            Utility.showOkAlert(message: ErrorMessage.validEmail)
            return false
        }
        
        guard !self.password.isEmpty else {
            Utility.showOkAlert(message: ErrorMessage.passwordEmpty)
            return false
        }
        
        return true
    }
}
