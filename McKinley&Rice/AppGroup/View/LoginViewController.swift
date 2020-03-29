//
//  LoginViewController.swift
//  McKinley&Rice
//
//  Created by Soumya Jain on 30/03/20.
//  Copyright © 2020 Soumya Jain. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var viewModel: LoginViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupInitialData()
        self.setupViews()
    }
    
    private func setupInitialData() {
        self.viewModel = LoginViewModel()
        self.addObservers()
    }

    private func addObservers() {
        self.viewModel.loginSuccess = { [weak self] (token) in
            print(token)
        }
    }
    
    private func setupViews() {
        self.idTextField.delegate = self
        self.passwordTextField.delegate = self
        self.loginButton.configureThemeButton(text: "LOGIN")
    }
    
    @IBAction func loginAction(_ sender: Any) {
        self.viewModel.login()
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let updatedText = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        switch textField {
        case self.idTextField:
            self.viewModel.updateData(text: updatedText, for: .id)
        case self.passwordTextField:
            self.viewModel.updateData(text: updatedText, for: .password)
        default:
            break
        }
        return true
    }
    
}
