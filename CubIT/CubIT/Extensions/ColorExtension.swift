//
//  ColorExtension.swift
//  CubIT
//
//  Created by Марія Кухарчук on 05.04.2022.
//

import Foundation
import UIKit

extension UIColor {
   
    struct CustomColors{
        static let darkGray = UIColor.init(netHex: 0x14141C)
        static let secondary = UIColor.init(netHex: 0x6C757D)
    }
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }

}
