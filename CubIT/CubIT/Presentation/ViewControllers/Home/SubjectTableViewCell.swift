//
//  SubjectTableViewCell.swift
//  CubIT
//
//  Created by Марія Кухарчук on 07.05.2022.
//

import UIKit

class SubjectTableViewCell: UITableViewCell {
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    
    @IBOutlet weak var subjectLabel: UILabel!
    
    @IBOutlet weak var teacherLabel: UILabel!
    
    @IBOutlet weak var moreButton: UIButton!
    
    @IBOutlet weak var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = .clear
        
        // subject
        subjectLabel.textColor = .white
        
        //teacher
        teacherLabel.textColor = .white
        
        //button
        moreButton.setImage( UIImage(systemName: "ellipsis"), for: .normal)
        moreButton.tintColor = .white
        moreButton.setTitle("", for: .normal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
