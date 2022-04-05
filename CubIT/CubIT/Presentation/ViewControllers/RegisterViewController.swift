//
//  RegisterViewController.swift
//  CubIT
//
//  Created by Марія Кухарчук on 05.04.2022.
//

import UIKit

class RegisterViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    private let registerViewModel = RegisterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        // Do any additional setup after loading the view.
    }
    
    
    private func setUI(){
        view.backgroundColor = .CustomColors.darkGray
        setUsernameTextField()
        setEmailTextField()
        setPasswordTextField()
        setRegisterButton()
    }
    
    private func setUsernameTextField(){
        usernameTextField.placeholder = registerViewModel.usernameTextFieldTitle
        usernameTextField.backgroundColor = .CustomColors.secondary
        usernameTextField.textColor = .white
        usernameTextField.font =  UIFont(name: "HelveticaNeue", size: CGFloat(18.0))
        usernameTextField.autocapitalizationType = .none
        usernameTextField.autocorrectionType = .no
        usernameTextField.returnKeyType = .done
    }
    
    private func setEmailTextField(){
        emailTextField.placeholder = registerViewModel.emailTextFieldTitle
        emailTextField.backgroundColor = .CustomColors.secondary
        emailTextField.textColor = .white
        emailTextField.font =  UIFont(name: "HelveticaNeue", size: CGFloat(18.0))
        emailTextField.autocapitalizationType = .none
        emailTextField.autocorrectionType = .no
        emailTextField.returnKeyType = .done
    }
    
    private func setPasswordTextField(){
        passwordTextField.placeholder = registerViewModel.passwordTextFieldTitle
        passwordTextField.backgroundColor = .CustomColors.secondary
        passwordTextField.textColor = .white
        passwordTextField.font =  UIFont(name: "HelveticaNeue", size: CGFloat(18.0))
        passwordTextField.autocapitalizationType = .none
        passwordTextField.autocorrectionType = .no
        passwordTextField.returnKeyType = .done
        passwordTextField.isSecureTextEntry = true
    }
    
    private func setRegisterButton(){
        registerButton.titleLabel?.text = registerViewModel.registerButtonTitle
        registerButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: CGFloat(18.0))
        registerButton.titleLabel?.textColor = .white
        registerButton.backgroundColor = .CustomColors.secondary
        registerButton.layer.cornerRadius = 5
    }

}
