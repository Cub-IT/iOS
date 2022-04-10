//
//  HomeViewController.swift
//  CubIT
//
//  Created by Марія Кухарчук on 05.04.2022.
//

import UIKit

class HomeViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    
    var delegate: SideMenuViewControllerDelegate?
    
    @IBOutlet weak var sideMenuButton: UIBarButtonItem!    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationItem.hidesBackButton = true
        //Set UI
        setUI()
        //coordinator?.back()
        navigationController?.isToolbarHidden = false
        setNavigation()
        
    }
    
    private func setUI(){
        view.backgroundColor = .CustomColors.darkGray
        setButton()
    }
    
    private func setButton(){
        //sideMenuButton.setImage(UIImage(systemName: "text.justify"), for: .normal)
        //sideMenuButton.tintColor = .white
       // sideMenuButton.setTitle("", for: .normal)
        //sideMenuButton.backgroundColor = .black
    }
    
    func setNavigation(){
        
        self.navigationItem.title = "Home"
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "text.justify") , style: .plain, target: self, action: #selector(handleMenu))
    }
    
    @objc func handleMenu(){
        print("Click On menuHandler")
        delegate?.handleMenuToggle(forMenuOption: nil)
    }
    
    
    
    
}
