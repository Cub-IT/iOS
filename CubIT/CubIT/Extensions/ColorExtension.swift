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
        static let darkGray = UIColor.init(netHex: 0x15161B)
        static let secondary = UIColor.init(netHex: 0x6C757D)
        static let green = UIColor.init(red: 35, green: 134, blue: 54)
        
        var randomColor: UIColor = {
            let colors: [UIColor] = [
                UIColor.init(netHex: 0xDEA057),
                UIColor.init(netHex: 0xCE9461),
                UIColor.init(netHex: 0x85586F),
                UIColor.init(netHex: 0xA64B2A),
                UIColor.init(netHex: 0x9FC088),
                UIColor.init(netHex: 0x112B3C)
            ]
            
            return colors.randomElement() ?? UIColor.red
        }()
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
