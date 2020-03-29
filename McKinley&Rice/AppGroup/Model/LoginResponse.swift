//
//  LoginResponse.swift
//  McKinley&Rice
//
//  Created by Soumya Jain on 30/03/20.
//  Copyright © 2020 Soumya Jain. All rights reserved.
//

import Foundation

struct LoginResponse: Codable {
    var token: String?
    var error: String?
    
    func getErrorMessage() -> Error {
        return ResponseError.customError(self.error ?? ErrorMessage.somethingWrong)
    }
}
