//
//  HomeViewModel.swift
//  CubIT
//
//  Created by Марія Кухарчук on 03.05.2022.
//

import Foundation
import UIKit

struct HomeViewModel {
    let title = "Home"
    
    let subjectsMenu = [
        SubjectModel(name: "Algorithms", teacher: "Slabo Huisky", backgroundColor: UIColor.CustomColors().randomColor),
        SubjectModel(name: "Algorithms", teacher: "Slabo Huisky", backgroundColor: UIColor.CustomColors().randomColor),
        SubjectModel(name: "Algorithms", teacher: "Slabo Huisky", backgroundColor: UIColor.CustomColors().randomColor),
        SubjectModel(name: "Algorithms", teacher: "Slabo Huisky", backgroundColor: UIColor.CustomColors().randomColor),
        SubjectModel(name: "Algorithms", teacher: "Slabo Huisky", backgroundColor: UIColor.CustomColors().randomColor),
        SubjectModel(name: "Algorithms", teacher: "Slabo Huisky", backgroundColor: UIColor.CustomColors().randomColor),
        SubjectModel(name: "Algorithms", teacher: "Slabo Huisky", backgroundColor: UIColor.CustomColors().randomColor)
    ]
    
//    func pushToViewController(at indexPath: IndexPath, with coordinator: MainCoordinator?) {
//            switch ViewControllerIDs.allCases[indexPath.row] {
//            case .profile:
//                coordinator?.moveToProfile()
//            case .progress:
//                coordinator?.moveToProgress()
//            case .programs:
//                coordinator?.moveToPrograms()
//            case .calculator:
//                coordinator?.moveToCalculator()
//            case .muscles:
//                coordinator?.moveToMuscles()
//            }
//        }
}
