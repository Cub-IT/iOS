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
    
    
    
    //example
//        func start() {
//            ProfileManager.sharedInstance.fetchSavedProfile()
//
//            if ProfileManager.sharedInstance.userProfile != nil {
//                home()
//            } else {
//                let vc = StartViewController.instantiate()
//                vc.coordinator = self
//                navigationController.pushViewController(vc, animated: false)
//            }
//        }
    
    func start() {
        let vc = LoginViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func sidemenu(){
        let vc = SideMenuViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func mainscreen(){
        let vc = MainViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func back() {
        navigationController.popViewController(animated: true)
    }
    
}


