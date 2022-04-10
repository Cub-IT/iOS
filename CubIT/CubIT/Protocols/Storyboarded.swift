//
//  Storyboarded.swift
//  CubIT
//
//  Created by Марія Кухарчук on 27.03.2022.
//

import Foundation
import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let storyboardIdentifier = String(describing: self)
        let storyboard = UIStoryboard(name: storyboardIdentifier, bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as? Self else {
          fatalError("The ViewController of \(storyboard.classForCoder) is not of class \(self)")
      }
      return viewController
    }
}
