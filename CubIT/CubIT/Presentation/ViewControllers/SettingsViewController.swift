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
    
    let settingsViewModel = SettingsViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = settingsViewModel.title
    }
    

    @IBAction func logOutButtonTapped(_ sender: UIButton) {
        UserDefaults.standard.set(nil, forKey: "status")
        print("Button tapped")
        

        let vc = LoginViewController.instantiate()
        let _ = vc.view
        
        //MainViewController().moveToGivenVC(vc: vc)

        navigationController?.popViewController(animated: true)
        navigationController?.pushViewController(vc, animated: false)
        
        let allControllers = NSMutableArray(array: navigationController!.viewControllers)
        print(allControllers.count)
        allControllers.removeObject(at: allControllers.count-2)
        navigationController!.setViewControllers(allControllers as [AnyObject] as! [UIViewController], animated: false)
    }
    
}
