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
    }
    
    

    @IBAction func registerButtonTapped(_ sender: UIButton) {
        coordinator?.register()
    }
    
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
    }
    
    private func setUI(){
        view.backgroundColor = .CustomColors.darkGray
        setRegisterButton()
        setEmailTextField()
        setPasswordTextField()
        setLoginButton()
    }
    
    private func setRegisterButton(){
        registerButton.titleLabel?.text = loginViewModel.registerButtonTitle
        registerButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: CGFloat(18.0))
        registerButton.titleLabel?.textColor = .white
        registerButton.backgroundColor = .CustomColors.secondary
        registerButton.layer.cornerRadius = 5
    }
    
    private func setEmailTextField(){
        emailTextField.placeholder = loginViewModel.emailTextFieldTitle
        emailTextField.backgroundColor = .CustomColors.secondary
        emailTextField.textColor = .white
        emailTextField.font =  UIFont(name: "HelveticaNeue", size: CGFloat(18.0))
        emailTextField.autocapitalizationType = .none
        emailTextField.autocorrectionType = .no
        emailTextField.returnKeyType = .done
    }
    
    private func setPasswordTextField(){
        passwordTextField.placeholder = loginViewModel.passwordTextFieldTitle
        passwordTextField.backgroundColor = .CustomColors.secondary
        passwordTextField.textColor = .white
        passwordTextField.font =  UIFont(name: "HelveticaNeue", size: CGFloat(18.0))
        passwordTextField.autocapitalizationType = .none
        passwordTextField.autocorrectionType = .no
        passwordTextField.returnKeyType = .done
        passwordTextField.isSecureTextEntry = true
    }
    
    private func setLoginButton(){
        loginButton.titleLabel?.text = loginViewModel.loginButtonTitle
        loginButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: CGFloat(18.0))
        loginButton.titleLabel?.textColor = .white
        loginButton.backgroundColor = .CustomColors.secondary
        loginButton.layer.cornerRadius = 5
    }
    
    
}
