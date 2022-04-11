//
//  LoginViewController.swift
//  CubIT
//
//  Created by Марія Кухарчук on 27.03.2022.
//

import UIKit

class LoginViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    
    var delegate: SideMenuViewControllerDelegate?
    
    private let loginViewModel = LoginViewModel()
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signInLabel: UILabel!
    @IBOutlet weak var cubImage: UIImageView!
    @IBOutlet weak var githubLoginButton: UIButton!
    @IBOutlet weak var googleLoginButton: UIButton!
    @IBOutlet weak var linkedinLiginButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var newUserLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        navigationController?.navigationBar.isHidden = true
//        emailTextField.delegate = self
//        passwordTextField.delegate = self
    }
    

    @IBAction func registerButtonTapped(_ sender: UIButton) {
        coordinator?.register()
    }
    
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        if correctTextField(){
            coordinator?.mainscreen()
        }
        
       
        
        
//        let mainControlView = MainViewController()
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainControlView)
        
//        UserDefaults.standard.set(true, forKey: "status")
//                Switcher.updateRootVC()
    }
    
    
    
    
    @IBAction func githubButtonTapped(_ sender: UIButton) {
        sender.animateTap()
        
    }
    
    @IBAction func googleButtonTapped(_ sender: UIButton) {
        sender.animateTap()
    }
    
    
    @IBAction func linkedinButtonTapped(_ sender: UIButton) {
        sender.animateTap()
    }
}




// MARK: - UI
extension LoginViewController {
    
    private func setUI(){
        view.backgroundColor = .CustomColors.darkGray
        setRegisterButton()
        setEmailTextField()
        setPasswordTextField()
        setLoginButton()
        setImage()
        setSignInLabel()
        setLoginButtons()
        setNewUserLabel()
        setForgotPasswordButton()
    }
    
    private func setImage(){
        let maskLayer = CAGradientLayer()
        maskLayer.frame = cubImage.bounds
        maskLayer.shadowRadius = 5
        maskLayer.shadowPath = CGPath(roundedRect: cubImage.bounds.insetBy(dx: 5, dy: 5), cornerWidth: 20, cornerHeight: 20, transform: nil)
        maskLayer.shadowOpacity = 1
        maskLayer.shadowOffset = CGSize.zero
        maskLayer.shadowColor = UIColor.white.cgColor
        cubImage.layer.mask = maskLayer
    }
    
    private func setSignInLabel(){
        signInLabel.text = loginViewModel.signInLabelText
        signInLabel.textColor = .white
        signInLabel.font = .CustomFont.titleFont
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
        loginButton.backgroundColor = .CustomColors.green
        loginButton.layer.cornerRadius = 5
    }
    
    private func setForgotPasswordButton(){
        registerButton.titleLabel?.text = loginViewModel.forgotPasswordButtonTitle
        registerButton.titleLabel?.font =  UIFont(name: "system", size: 14.0)
        registerButton.titleLabel?.textColor = .systemBlue
        registerButton.backgroundColor = .clear
        registerButton.layer.cornerRadius = 5
    }
    
    private func setLoginButtons(){
        let gitImage = UIImage(named: "GitHubLogo")
        githubLoginButton.setTitle("", for: .normal)
        githubLoginButton.setImage(gitImage, for: .normal)
        googleLoginButton.contentMode = .scaleAspectFill
        
        let googleImg = UIImage(named: "GoogleLogo")
        googleLoginButton.setTitle("", for: .normal)
        googleLoginButton.setImage(googleImg, for: .normal)
        googleLoginButton.contentMode = .scaleAspectFill
        
        
        
        let linkedinImg = UIImage(named: "LinkedInLogo")
        linkedinLiginButton.setImage(linkedinImg, for: .normal)
        linkedinLiginButton.setTitle("", for: .normal)
        linkedinLiginButton.imageView?.contentMode = .scaleAspectFill
    }
    
    private func setNewUserLabel(){
        newUserLabel.text = loginViewModel.newUserLabelText
        newUserLabel.textColor = .white
        newUserLabel.font = .CustomFont.defaultFont
    }
    
    private func setRegisterButton(){
        registerButton.titleLabel?.text = loginViewModel.registerButtonTitle
        registerButton.titleLabel?.font =  .CustomFont.defaultFont
        registerButton.titleLabel?.textColor = .systemBlue
        registerButton.backgroundColor = .clear
        registerButton.layer.cornerRadius = 5
    }
}

// MARK: - TextField Check
extension LoginViewController {
    func correctTextField() -> Bool{
        let alert = UIAlertController(title: "Uncorrect data", message: "Please, check email or password", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        
        if emailTextField.text?.isEmpty ?? true || passwordTextField.text?.isEmpty ?? true{
            self.present(alert, animated: true, completion: nil)
                // Display alert message
                return false
            }
        
        return true
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
