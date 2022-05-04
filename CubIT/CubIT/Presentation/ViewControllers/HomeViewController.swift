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
    
    var currentSelectedCell: Int = 0
    
    let homeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        setUI()
        self.title = "Home"
        navigationController?.isToolbarHidden = false
        self.navigationItem.title = homeViewModel.title
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "text.justify") , style: .plain, target: self, action: #selector(sideMenuButtonTapped))
    }
    
    @objc func sideMenuButtonTapped(_ sender: UIBarButtonItem) {
        print("Click On menuHandler")
        delegate?.selectedCell(currentSelectedCell)
    }
    

    private func setUI(){
        view.backgroundColor = .CustomColors.darkGray
    }
    
    
}
