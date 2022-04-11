//
//  Coordinator+Login.swift
//  CubIT
//
//  Created by Марія Кухарчук on 11.04.2022.
//

import Foundation

extension MainCoordinator{
    func login(){
        let loginViewController = LoginViewController.instantiate()
        loginViewController.coordinator = self
        navigationController.pushViewController(loginViewController, animated: true)
    }
}
