//
//  LoginViewController.swift
//  CubIT
//
//  Created by Марія Кухарчук on 27.03.2022.
//

import UIKit

class LoginViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    private let loginViewModel = LoginViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
//        emailTextField.delegate = self
//        passwordTextField.delegate = self
    }
    
    

    @IBAction func registerButtonTapped(_ sender: UIButton) {
        coordinator?.register()
    }
    
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
    }
    
//    private func loginButtonTapped(){
//        
//    }
    
    private func setUI(){
        view.backgroundColor = .CustomColors.darkGray
        setRegisterButton()
        setEmailTextField()
        setPasswordTextField()
        setLoginButton()
    }
    
    private func setRegisterButton(){
        registerButton.titleLabel?.text = loginViewModel.registerButtonTitle
        registerButton.titleLabel?.font =  .CustomFont.defaultFont
        registerButton.titleLabel?.textColor = .white
        registerButton.backgroundColor = .CustomColors.secondary
        registerButton.layer.cornerRadius = 5
    }
    
    private func setEmailTextField(){
        emailTextField.attributedPlaceholder = NSAttributedString(
            string: loginViewModel.emailTextFieldTitle,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        emailTextField.backgroundColor = .CustomColors.secondary
        emailTextField.textColor = .white
        emailTextField.font =   .CustomFont.defaultFont
        emailTextField.autocapitalizationType = .none
        emailTextField.autocorrectionType = .no
        emailTextField.returnKeyType = .done
    }
    
    private func setPasswordTextField(){
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: loginViewModel.passwordTextFieldTitle,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        passwordTextField.backgroundColor = .CustomColors.secondary
        passwordTextField.textColor = .white
        passwordTextField.font =  .CustomFont.defaultFont
        passwordTextField.autocapitalizationType = .none
        passwordTextField.autocorrectionType = .no
        passwordTextField.returnKeyType = .done
        passwordTextField.isSecureTextEntry = true
    }
    
    private func setLoginButton(){
        loginButton.titleLabel?.text = loginViewModel.loginButtonTitle
        loginButton.titleLabel?.font =  .CustomFont.defaultFont
        loginButton.titleLabel?.textColor = .white
        loginButton.backgroundColor = .CustomColors.secondary
        loginButton.layer.cornerRadius = 5
    }
    
    
}


//extension LoginViewController: UITextFieldDelegate{
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//
//            if textField == emailTextField {
//                passwordTextField.becomeFirstResponder()
//            }
//            else if textField == passwordTextField {
//                loginButtonTapped()
//            }
//
//            return true
//        }
//}
