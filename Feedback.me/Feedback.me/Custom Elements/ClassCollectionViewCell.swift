//
//  ClassCollectionViewCell.swift
//  Feedback.me
//
//  Created by Alexander Dejeu on 1/7/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import UIKit

class ClassCollectionViewCell: UICollectionViewCell {
    //MARK: - IBOutlets
    @IBOutlet weak var classTitleLabel: UILabel!
    @IBOutlet weak var classInstructorLabel: UILabel!
    
    
    //MARK: - Helpers
    func styleCell(){
        self.layer.borderColor = UIColor(red: 155.0/255.0, green: 155.0/255.0, blue: 155.0/255.0, alpha: 1.0).cgColor
        self.layer.borderWidth = 1
        self.backgroundColor = .white
    }
    
    func fitLabels(){
        classTitleLabel.adjustsFontSizeToFitWidth = true
        classInstructorLabel.adjustsFontSizeToFitWidth = true
        
        classTitleLabel.minimumScaleFactor = 0.5
        classInstructorLabel.minimumScaleFactor = 0.5
        
        classTitleLabel.lineBreakMode = .byClipping
        classInstructorLabel.lineBreakMode = .byClipping
    }
}
