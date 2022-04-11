//
//  Switcher.swift
//  CubIT
//
//  Created by Марія Кухарчук on 10.04.2022.
//

import Foundation
import UIKit

class Switcher {
    
    static func updateRootVC(){
        
        let status = UserDefaults.standard.bool(forKey: "status")
        var rootVC : UIViewController?
       
            print(status)
        

        if(status == true){
            rootVC = MainViewController.instantiate()
//            UIStoryboard(name: "MainViewController", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        }else{
            rootVC = LoginViewController.instantiate()
            //UIStoryboard(name: "LoginViewController", bundle: nil) as! LoginViewController
        }
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let appDelegate = windowScene.delegate as? SceneDelegate else {
                  return
              }
                appDelegate.window?.rootViewController = rootVC
        
    }
    
}
