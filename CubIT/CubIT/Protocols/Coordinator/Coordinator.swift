//
//  Coordinator.swift
//  CubIT
//
//  Created by Марія Кухарчук on 27.03.2022.
//

import Foundation
import UIKit

protocol Coordinator {
    
    var navigationController: UINavigationController { get set }
    
    func start()
}
