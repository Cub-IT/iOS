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

extension Storyboarded where Self: UIViewController{
    static func instantiate() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: id, bundle: .main)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}
