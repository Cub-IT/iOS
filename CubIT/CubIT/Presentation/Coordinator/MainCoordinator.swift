//
//  MainCoordinator.swift
//  CubIT
//
//  Created by Марія Кухарчук on 27.03.2022.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(naviagtionController: UINavigationController){
        self.navigationController = naviagtionController
    }
    
    func start() {
        let vc = LoginViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    
    func register(){
        let registerViewController = RegisterViewController.instantiate()
        registerViewController.coordinator = self
        navigationController.pushViewController(registerViewController, animated: true)
    }
    
//    func start() {
//        ProfileManager.sharedInstance.fetchSavedProfile()
//
//        if ProfileManager.sharedInstance.userProfile != nil {
//            home()
//        } else {
//            let vc = StartViewController.instantiate()
//            vc.coordinator = self
//            navigationController.pushViewController(vc, animated: false)
//        }
//    }
//
//    func home() {
//        let vc = HomeViewController.instantiate()
//        vc.coordinator = self
//        navigationController.pushViewController(vc, animated: true)
//    }
    
    func back() {
        navigationController.popViewController(animated: true)
    }
    
}


