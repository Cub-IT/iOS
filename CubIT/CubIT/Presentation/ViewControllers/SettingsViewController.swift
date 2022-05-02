//
//  SettingsViewController.swift
//  CubIT
//
//  Created by Марія Кухарчук on 30.04.2022.
//

import UIKit

class SettingsViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    
    var delegate: SideMenuViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
    }
    
    
    

    @IBAction func logOutButtonTapped(_ sender: UIButton) {
        UserDefaults.standard.set(nil, forKey: "status")
        print("Button tapped")
        
        let storyboard = UIStoryboard(name: "LoginViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        let _ = vc!.view
        
        navigationController?.popViewController(animated: true)
        navigationController?.pushViewController(vc!, animated: true)
    }
    
}
