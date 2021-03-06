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
    
    private var sideMenuViewController : SideMenuViewController!
    
    private var homeViewController : HomeViewController = {
        let vc = HomeViewController.instantiate()
        let _ = vc.view
        return vc
    }()
    
    private var settingsViewController: SettingsViewController = {
        let vc = SettingsViewController.instantiate()
        let _ = vc.view
        return vc
    }()
    
    private var centerVC :UIViewController!
    private var currentVC: UIViewController!
    
    var isExpandMenu : Bool = false
    
    var sideMenuShadowView: UIView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .CustomColors.darkGray
        addSubviews()
        navigationController?.navigationBar.isHidden = true
    }
    
    func addSubviews(){
        //home
        homeViewController.delegate = self
        centerVC = UINavigationController(rootViewController: homeViewController)
        view.addSubview(centerVC.view)
        //view.insertSubview(centerVC.view, at: 0)
        addChild(centerVC)
        centerVC.didMove(toParent: self)
        currentVC = homeViewController
        
        //menu
        if sideMenuViewController == nil {
            sideMenuViewController = SideMenuViewController.instantiate()
            let _ = sideMenuViewController.view
            sideMenuViewController.delegate = self
            view.insertSubview(sideMenuViewController.view, at: 0)
            addChild(sideMenuViewController)
            sideMenuViewController.didMove(toParent: self)
        }
        
        //shadow
        self.sideMenuShadowView = UIView(frame: self.view.bounds)
        self.sideMenuShadowView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.sideMenuShadowView.backgroundColor = .black
        self.sideMenuShadowView.alpha = 0.0
        homeViewController.view.addSubview(self.sideMenuShadowView)
    }
    
    func didSelectMenuOption(menuOption: Int) {
        switch menuOption {
        case 0:
            print("Show Home")
            if currentVC.title != "Home" {
                currentVC.view.removeFromSuperview()
                currentVC.didMove(toParent: nil)
                homeViewController.navigationItem.title = homeViewController.title
            }
            homeViewController.currentSelectedCell = 0
        case 1:
            print("Show Profile")
            // moveToAnotherView(vc: profileVC)
        case 2:
            print("Show Settings")
            moveToAnotherView(vc: settingsViewController)
            currentVC = settingsViewController
            homeViewController.currentSelectedCell = 2
        case 3:
            let controller = HomeViewController.instantiate()
            present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
        default:
            print("no cell")
        }
    }
    
    func moveToAnotherView(vc: UIViewController){
        homeViewController.addChild(vc)
        self.homeViewController.view.addSubview(vc.view)
        vc.view.frame = view.frame
        vc.didMove(toParent: homeViewController)
        homeViewController.navigationItem.title = vc.title
    }
}


// MARK-- animation
extension MainViewController {
    
    func animatePanel(shouldExpand: Bool, row: Int?) {
        
        if shouldExpand {
            // show menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerVC.view.frame.origin.x = self.centerVC.view.frame.width - 130
                self.sideMenuShadowView.alpha = 0.3
            }, completion: nil)
            
        } else {
            // hide menu
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerVC.view.frame.origin.x = 0
                self.sideMenuShadowView.alpha = 0.0
            }) { (_) in
                guard let row = row else { return }
                self.didSelectMenuOption(menuOption: row)
            }
        }
        
        animateStatusBar()
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
            if sideMenuViewController == nil {
                sideMenuViewController =  SideMenuViewController.instantiate()
                let _ = sideMenuViewController.view
                sideMenuViewController.delegate = self
                view.insertSubview(sideMenuViewController.view, at: 0)
                addChild(sideMenuViewController)
                sideMenuViewController.didMove(toParent: self)
            }
        }
        
        isExpandMenu = !isExpandMenu
        animatePanel(shouldExpand: isExpandMenu, row: row)
    }
}
