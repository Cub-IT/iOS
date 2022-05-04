//
//  RegisterViewController.swift
//  CubIT
//
//  Created by Марія Кухарчук on 05.04.2022.
//

import UIKit

class RegisterViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    
    @IBOutlet weak var signUpLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var passwordTextField2: UITextField!
    @IBOutlet weak var githubRegisterButton: UIButton!
    @IBOutlet weak var googleRegisterButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var linkedinRegisterButton: UIButton!
    
    private let registerViewModel = RegisterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        navigationController?.navigationBar.isHidden = true
        
    }
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        coordinator?.backMoveDisable()
        coordinator?.mainscreen()
    }
    
    @IBAction func backToLoginButtonTapped(_ sender: UIButton) {
        let allControllers = NSMutableArray(array: navigationController!.viewControllers)
        allControllers.removeObject(at: allControllers.count - 1)
        navigationController!.setViewControllers(allControllers as [AnyObject] as! [UIViewController], animated: false)
        coordinator?.backMoveDisable()
        coordinator?.login()
    }
    
    @IBAction func githubRegisterButtonTap(_ sender: UIButton) {
        sender.animateTap()
    }
    
    @IBAction func googleRegisterButtonTap(_ sender: UIButton) {
        sender.animateTap()
    }
    
    @IBAction func linkedinRegisterButtonTap(_ sender: UIButton) {
        sender.animateTap()
    }
}



// MARK: - UI
extension RegisterViewController{
    private func setUI(){
        view.backgroundColor = .CustomColors.darkGray
        setUsernameTextField()
        setEmailTextField()
        setPasswordTextField()
        setRegisterButton()
        setPasswordTextField2()
        setRegisterButtons()
        setLoginButton()
    }
    
    private func setSignUpLabel(){
        signUpLabel.text = registerViewModel.signUpLabelText
        signUpLabel.textColor = .white
        signUpLabel.font = .CustomFont.titleFont
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
        registerButton.backgroundColor = .CustomColors.green
        registerButton.layer.cornerRadius = 5
    }
    
    private func setRegisterButtons(){
        let gitImage = UIImage(named: "GitHubLogo")
        githubRegisterButton.setTitle("", for: .normal)
        githubRegisterButton.setImage(gitImage, for: .normal)
        githubRegisterButton.contentMode = .scaleAspectFill
        
        let googleImg = UIImage(named: "GoogleLogo")
        googleRegisterButton.setTitle("", for: .normal)
        googleRegisterButton.setImage(googleImg, for: .normal)
        googleRegisterButton.contentMode = .scaleAspectFill
        
        
        
        let linkedinImg = UIImage(named: "LinkedInLogo")
        linkedinRegisterButton.setImage(linkedinImg, for: .normal)
        linkedinRegisterButton.setTitle("", for: .normal)
        linkedinRegisterButton.imageView?.contentMode = .scaleAspectFill
    }

    private func setLoginButton(){
        loginButton.titleLabel?.text = registerViewModel.loginButtonTitle
        loginButton.titleLabel?.font =  .CustomFont.defaultFont
        loginButton.titleLabel?.textColor = .systemBlue
        loginButton.backgroundColor = .clear
        loginButton.layer.cornerRadius = 5
    }
    
}
