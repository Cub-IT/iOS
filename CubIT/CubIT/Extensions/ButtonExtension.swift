//
//  ButtonExtension.swift
//  CubIT
//
//  Created by Марія Кухарчук on 10.04.2022.
//

import Foundation
import UIKit

extension UIButton {
    func animateTap(){
        self.alpha = 0.5
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
              //Bring's sender's opacity back up to fully opaque.
            self.alpha = 1.0
          }
    }
}
