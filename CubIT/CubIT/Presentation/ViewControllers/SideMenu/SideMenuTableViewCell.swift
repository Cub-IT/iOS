//
//  SideMenuTableViewCell.swift
//  CubIT
//
//  Created by Марія Кухарчук on 05.04.2022.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {
    
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    
    
    @IBOutlet var iconImageView: UIImageView! = UIImageView()
    @IBOutlet var titleLabel: UILabel! = UILabel()
    
//    let iconImageView: UIImageView = {
//        let iv = UIImageView()
//        iv.contentMode = .scaleAspectFit
//        iv.clipsToBounds = true
//        iv.tintColor = .white
//        return iv
//    }()
//
//    let titleLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .white
//        label.font = .CustomFont.defaultFont
//        label.text = "Sample text"
//        return label
//    }()
    
    // MARK: - Init
    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        
//        backgroundColor = .clear
//        selectionStyle = .none
//        
//        addSubview(iconImageView)
//        iconImageView.translatesAutoresizingMaskIntoConstraints = false
//        iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        iconImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
//        iconImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
//        iconImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
//        
//        addSubview(titleLabel)
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        titleLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 12).isActive = true
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Background
        self.backgroundColor = .clear
        
        // Icon
        self.iconImageView.tintColor = .white
        
        // Title
        self.titleLabel.textColor = .white
        self.titleLabel.font = .CustomFont.defaultFont
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
