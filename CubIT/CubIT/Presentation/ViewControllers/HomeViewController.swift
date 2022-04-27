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
    
    var testButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.setTitle("Log out", for: .normal)
        button.backgroundColor = .CustomColors.green
        return button
    }()
    
    
    
    override func viewDidLoad() {
        setUI()
        //coordinator?.back()
        navigationController?.isToolbarHidden = false
        self.navigationItem.title = "Home"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "text.justify") , style: .plain, target: self, action: #selector(sideMenuButtonTapped))
    }
    
    @objc func sideMenuButtonTapped(_ sender: UIBarButtonItem) {
        print("Click On menuHandler")
        delegate?.selectedCell(0)
    }
    

    private func setUI(){
        view.backgroundColor = .CustomColors.darkGray
    }
 
    @IBAction func logOutButtonTest(_ sender: Any) {
        UserDefaults.standard.set(nil, forKey: "status")
        print("Button tapped")
        
        let storyboard = UIStoryboard(name: "LoginViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        let _ = vc!.view
        
        navigationController?.popViewController(animated: true)
        navigationController?.pushViewController(vc!, animated: true)
        //coordinator?.login()
        
    }
    
    
}
