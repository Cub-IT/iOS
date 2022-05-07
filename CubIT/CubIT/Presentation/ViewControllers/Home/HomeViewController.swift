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
    
    
    @IBOutlet weak var subjectTableView: UITableView!
    
    
    override func viewDidLoad() {
        setUI()
        setNavigation()
        setTableView()
    }
    
    @objc func sideMenuButtonTapped(_ sender: UIBarButtonItem) {
        print("Click On menuHandler")
        delegate?.selectedCell(currentSelectedCell)
    }
    
    private func setNavigation(){
        self.title = homeViewModel.title
        navigationController?.isToolbarHidden = false
        self.navigationItem.title = homeViewModel.title
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "text.justify") , style: .plain, target: self, action: #selector(sideMenuButtonTapped))
    }
    
    private func setUI(){
        view.backgroundColor = .CustomColors.darkGray
       
    }
    
    private func setTableView(){
        subjectTableView.delegate = self
        subjectTableView.dataSource = self
        subjectTableView.backgroundColor = .clear
        subjectTableView.separatorStyle = .none
        subjectTableView.rowHeight = 150
        
        self.subjectTableView.register(SubjectTableViewCell.nib, forCellReuseIdentifier: SubjectTableViewCell.identifier)
        
        self.subjectTableView.reloadData()
    }
    
    
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.subjectsMenu.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SubjectTableViewCell.identifier, for: indexPath) as? SubjectTableViewCell else { fatalError("xib doesn't exist")}
        
        cell.subjectLabel.text = homeViewModel.subjectsMenu[indexPath.row].name
        
        cell.teacherLabel.text = homeViewModel.subjectsMenu[indexPath.row].teacher
        
        cell.backView.backgroundColor = homeViewModel.subjectsMenu[indexPath.row].backgroundColor
        cell.backView.layer.cornerRadius = 10
        cell.backView.clipsToBounds = true
       
        let selectedView = UIView()
        selectedView.backgroundColor = .clear
        cell.selectedBackgroundView = selectedView
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let currentCell = tableView.cellForRow(at: indexPath)! as! SubjectTableViewCell
        currentCell.backView.backgroundColor = self.homeViewModel.subjectsMenu[indexPath.row].backgroundColor.withAlphaComponent(0.8)
        
        //homeViewModel.pushToViewController(at: indexPath, with: coordinator)
    }
    

}
