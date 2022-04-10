//
//  Coordinator+Home.swift
//  CubIT
//
//  Created by Марія Кухарчук on 05.04.2022.
//

import Foundation

extension MainCoordinator {
    
    func home() {
        let homeViewController = HomeViewController.instantiate()
        homeViewController.coordinator = self
        navigationController.pushViewController(homeViewController, animated: true)
    }
    
}
