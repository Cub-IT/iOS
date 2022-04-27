//
//  ViewController.swift
//  CubIT
//
//  Created by Марія Кухарчук on 27.03.2022.
//

import UIKit
import SafariServices


class MainViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    
    var menuController : SideMenuViewController!
    var centerVC :UIViewController!
    var homeVC :HomeViewController!
    
    var isExpandMenu : Bool = false
    
    
    // Expand/Collapse the side menu by changing trailing's constant
    private var sideMenuTrailingConstraint: NSLayoutConstraint!
    
    private var revealSideMenuOnTop: Bool = true
    
    var gestureEnabled: Bool = true
    
    private var sideMenuShadowView: UIView!
    private var sideMenuRevealWidth: CGFloat = 260
    private let paddingForRotation: CGFloat = 150
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .CustomColors.darkGray
        configureHomeController()
        navigationController?.navigationBar.isHidden = true
    }
    
    
    override var prefersStatusBarHidden: Bool{
        return isExpandMenu
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation{
        return .slide
    }
    
    
    
    func configureStatusbarAnimation(){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            self.setNeedsStatusBarAppearanceUpdate()
        }, completion: nil)
    }
    
    func configureHomeController() {
        
        let storyboard = UIStoryboard(name: "HomeViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        let _ = vc!.view
        vc?.delegate = self
        centerVC = UINavigationController(rootViewController: vc!)
        //let homeController = HomeViewController()
        //let homeview = homeController.view
//        homeController.delegate = self
//        centerVC = UINavigationController(rootViewController: homeController)
        
        view.addSubview(centerVC.view)
        addChild(centerVC)
        centerVC.didMove(toParent: self)
    }
    
    func configureMenuController() {
        if menuController == nil {
            let storyboard = UIStoryboard(name: "SideMenuViewController", bundle: nil)
            menuController = storyboard.instantiateViewController(withIdentifier: "SideMenuViewController") as? SideMenuViewController
            let _ = menuController.view
            //menuController = SideMenuViewController()
            menuController.delegate = self
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
        }
    }
    
    func showMenu(isExpand:Bool){
        if isExpand {
            //open Menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
                self.centerVC.view.frame.origin.x = self.centerVC.view.frame.width - 100
            }, completion: nil)
        }else{
            //close Menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
                self.centerVC.view.frame.origin.x = 0
            }, completion: nil)
        }
        configureStatusbarAnimation()
    }
    
    func animatePanel(shouldExpand: Bool, row: Int?) {
        
        if shouldExpand {
            // show menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerVC.view.frame.origin.x = self.centerVC.view.frame.width - 80
            }, completion: nil)
            
        } else {
            // hide menu
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerVC.view.frame.origin.x = 0
            }) { (_) in
                guard let row = row else { return }
                self.didSelectMenuOption(menuOption: row)
            }
        }
        
        animateStatusBar()
    }
    
    func didSelectMenuOption(menuOption: Int) {
        switch menuOption {
        case 0:
            //configureLoginController()
            print("Show profile")
        case 1:
            print("Show Inbox")
        case 2:
            print("Show Notifications")
        case 3:
            let controller = HomeViewController()
            //controller.username = "Batman"
            present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
        default:
            print("no cell")
        }
    }
    
    func animateStatusBar() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.setNeedsStatusBarAppearanceUpdate()
        }, completion: nil)
    }
}

extension MainViewController : SideMenuViewControllerDelegate{
    
    func selectedCell(_ row: Int) {
        if !isExpandMenu {
            configureMenuController()
        }
        
        isExpandMenu = !isExpandMenu
        animatePanel(shouldExpand: isExpandMenu, row: row)
    }
}
