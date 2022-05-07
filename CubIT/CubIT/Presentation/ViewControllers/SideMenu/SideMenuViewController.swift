//
//  SideMenuViewController.swift
//  CubIT
//
//  Created by Марія Кухарчук on 05.04.2022.
//

import UIKit

//private let reuseIdentifer = "SideMenuTableViewCell"


protocol SideMenuViewControllerDelegate {
    func selectedCell(_ row: Int)
}

class SideMenuViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    
    var delegate: SideMenuViewControllerDelegate?
    
    @IBOutlet var bottomLabel: UILabel!
    @IBOutlet weak var cubImage: UIImageView!
    @IBOutlet var sideMenuTableView: UITableView!
    
    var defaultHighlightedCell: Int = 0
    
    let menu = SideMenuModel().menuModel
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        // TableView
        setTableView()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.view.layoutIfNeeded()
    }
    
    
    
    private func setUI(){
        view.backgroundColor = .CustomColors.darkGray
        setLabel()
        setImage()
    }
    
    private func setImage(){
        cubImage.frame = CGRect(x: view.width-130*2-30, y: 50, width: 60, height: 50)
    }
    
    private func setLabel(){
        bottomLabel.text = "Created by CubIT"
        bottomLabel.textColor = .white
        bottomLabel.font =   .CustomFont.titleFont
        bottomLabel.frame = CGRect(x: view.width-130*2-115, y: 825, width: 230, height: 35)
    }
    
    func setTableView() {
        sideMenuTableView.delegate = self
        sideMenuTableView.dataSource = self
        
        
        sideMenuTableView.backgroundColor = .CustomColors.darkGray
        sideMenuTableView.separatorStyle = .singleLine
        sideMenuTableView.rowHeight = 60
        
        DispatchQueue.main.async {
            let defaultRow = IndexPath(row: self.defaultHighlightedCell, section: 0)
            self.sideMenuTableView.selectRow(at: defaultRow, animated: false, scrollPosition: .none)
        }
        
        self.sideMenuTableView.register(SideMenuTableViewCell.nib, forCellReuseIdentifier: SideMenuTableViewCell.identifier)
        
        self.sideMenuTableView.reloadData()
        
    }
    
}


// MARK: - UITableViewDelegate

extension SideMenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

// MARK: - UITableViewDataSource

extension SideMenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menu.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SideMenuTableViewCell.identifier, for: indexPath) as? SideMenuTableViewCell else { fatalError("xib doesn't exist") }

        cell.iconImageView.image = self.menu[indexPath.row].icon
        cell.titleLabel.text = self.menu[indexPath.row].title

        // Highlighted color
        let myCustomSelectionColorView = UIView()
        myCustomSelectionColorView.backgroundColor = .CustomColors.secondary
        cell.selectedBackgroundView = myCustomSelectionColorView
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.selectedCell(indexPath.row)
        // Remove highlighted color when you press the 'Profile' and 'Like us on facebook' cell
        if indexPath.row == 1 || indexPath.row == 3 {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}
