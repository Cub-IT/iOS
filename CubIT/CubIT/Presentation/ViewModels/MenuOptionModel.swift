//
//  MenuOptionModel.swift
//  CubIT
//
//  Created by Марія Кухарчук on 09.04.2022.
//

import Foundation
import UIKit

enum MenuOption: Int, CustomStringConvertible {
    
    case Profile
    case Inbox
    case Notifications
    case Settings
    
    var description: String {
        switch self {
        case .Profile: return "Profile"
        case .Inbox: return "Inbox"
        case .Notifications: return "Notifications"
        case .Settings: return "Settings"
        }
    }
    
    var image: UIImage {
        switch self {
        case .Profile: return UIImage(systemName: "person") ?? UIImage()
        case .Inbox: return UIImage(systemName: "house") ?? UIImage()
        case .Notifications: return UIImage(systemName: "house") ?? UIImage()
        case .Settings: return UIImage(systemName: "house") ?? UIImage()
        }
    }
}
