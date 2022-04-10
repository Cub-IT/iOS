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
    @IBOutlet weak var passwordTextField2: UITextField!
    
    private let registerViewModel = RegisterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
       
    }
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        coordinator?.home()
    }
    
    private func setUI(){
        view.backgroundColor = .CustomColors.darkGray
        setUsernameTextField()
        setEmailTextField()
        setPasswordTextField()
        setRegisterButton()
        setPasswordTextField2()
    }
    
    private func setUsernameTextField(){
        usernameTextField.attributedPlaceholder = NSAttributedString(
            string: registerViewModel.usernameTextFieldTitle,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        usernameTextField.backgroundColor = .CustomColors.secondary
        usernameTextField.textColor = .white
        usernameTextField.font =  .CustomFont.defaultFont
        usernameTextField.autocapitalizationType = .none
        usernameTextField.autocorrectionType = .no
        usernameTextField.returnKeyType = .done
    }
    
    private func setEmailTextField(){
        emailTextField.attributedPlaceholder = NSAttributedString(
            string: registerViewModel.emailTextFieldTitle,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        emailTextField.backgroundColor = .CustomColors.secondary
        emailTextField.textColor = .white
        emailTextField.font = .CustomFont.defaultFont
        emailTextField.autocapitalizationType = .none
        emailTextField.autocorrectionType = .no
        emailTextField.returnKeyType = .done
    }
    
    private func setPasswordTextField(){
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: registerViewModel.passwordTextFieldTitle,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        passwordTextField.backgroundColor = .CustomColors.secondary
        passwordTextField.textColor = .white
        passwordTextField.font =   .CustomFont.defaultFont
        passwordTextField.autocapitalizationType = .none
        passwordTextField.autocorrectionType = .no
        passwordTextField.returnKeyType = .done
        passwordTextField.isSecureTextEntry = true
    }
    
    private func setPasswordTextField2(){
        passwordTextField2.attributedPlaceholder = NSAttributedString(
            string: registerViewModel.passwordTextFieldTitle2,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        passwordTextField2.backgroundColor = .CustomColors.secondary
        passwordTextField2.textColor = .white
        passwordTextField2.font =   .CustomFont.defaultFont
        passwordTextField2.autocapitalizationType = .none
        passwordTextField2.autocorrectionType = .no
        passwordTextField2.returnKeyType = .done
        passwordTextField2.isSecureTextEntry = true
    }
    
    private func setRegisterButton(){
        registerButton.titleLabel?.text = registerViewModel.registerButtonTitle
        registerButton.titleLabel?.font =  .CustomFont.defaultFont
        registerButton.titleLabel?.textColor = .white
        registerButton.backgroundColor = .CustomColors.secondary
        registerButton.layer.cornerRadius = 5
    }

}
