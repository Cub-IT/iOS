//
//  SideMenuNodel.swift
//  CubIT
//
//  Created by Марія Кухарчук on 05.04.2022.
//

import Foundation
import UIKit

struct SideMenuModel{
    var menuModel = [
        SideMenuOptionModel(icon: UIImage(systemName: "house.fill")!, title: "Home"),
        SideMenuOptionModel(icon: UIImage(systemName: "person")!, title: "Profile"),
        SideMenuOptionModel(icon: UIImage(systemName: "gear")!, title: "Settings"),
        SideMenuOptionModel(icon: UIImage(systemName: "hand.thumbsup.fill")!, title: "Like us on Github")
    ]
}

struct SideMenuOptionModel {
    var icon: UIImage
    var title: String
}
