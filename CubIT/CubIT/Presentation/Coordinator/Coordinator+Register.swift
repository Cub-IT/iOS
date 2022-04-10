//
//  Coordinator+Register.swift
//  CubIT
//
//  Created by Марія Кухарчук on 05.04.2022.
//

import Foundation

extension MainCoordinator{
    func register(){
        let registerViewController = RegisterViewController.instantiate()
        registerViewController.coordinator = self
        navigationController.pushViewController(registerViewController, animated: true)
    }
}
