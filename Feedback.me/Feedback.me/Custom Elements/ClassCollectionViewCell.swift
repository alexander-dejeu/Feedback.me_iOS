//
//  ClassCollectionViewCell.swift
//  Feedback.me
//
//  Created by Alexander Dejeu on 1/7/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import UIKit

class ClassCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var classTitleLabel: UILabel!
    @IBOutlet weak var classInstructorLabel: UILabel!
    
    func styleCell(){
        self.layer.borderColor = UIColor(red: 155.0/255.0, green: 155.0/255.0, blue: 155.0/255.0, alpha: 1.0).cgColor
        self.layer.borderWidth = 1
    }
}
