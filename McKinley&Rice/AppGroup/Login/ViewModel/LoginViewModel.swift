//
//  LoginViewModel.swift
//  McKinley&Rice
//
//  Created by Soumya Jain on 30/03/20.
//  Copyright © 2020 Soumya Jain. All rights reserved.
//

import Foundation

class LoginViewModel {
    private var loginData: Login
    var loginSuccess: ((_ token: String) -> Void)?
    
    enum FieldType {
        case id
        case password
    }
    
    init() {
        self.loginData = Login()
    }
    
    func updateData(text: String, for type: FieldType) {
        switch type {
        case .id:
            self.loginData.id = text
        case .password:
            self.loginData.password = text
        }
    }
    
    func login() {
        guard self.loginData.validateIdAndPassword() else {
            return
        }
        
        LoginService().login(with: loginData.id, and: loginData.password) { [weak self] (result) in
            switch result{
            case .success(let token):
                print(token)
                UserDefaults.set(token, forKey: .token)
                self?.loginSuccess?(token)
            case .failure:
                break
            }
        }
    }
}
