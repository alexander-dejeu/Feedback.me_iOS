//
//  MasteryCell.swift
//  Feedback.me
//
//  Created by Alexander Dejeu on 1/16/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import UIKit

class MasteryCell: UICollectionViewCell {
    @IBOutlet weak var detailView : UIView!
    @IBOutlet weak var detailLabel : UILabel!
    
    @IBOutlet weak var rubricView : UIView!
    @IBOutlet weak var masteryLabel : UILabel!
    @IBOutlet weak var masteryTitleLabel : UILabel!
    
    var chosenRubric = false
    
    func styleCell(){
        self.layer.borderColor = globalColors.student.cgColor
        self.layer.borderWidth = 1
        self.backgroundColor = globalColors.background
    }
    
    func selectedStyle(){
        if chosenRubric {
            self.backgroundColor = globalColors.student
            self.rubricView.backgroundColor = globalColors.student
            self.detailView.backgroundColor = globalColors.student
            detailLabel.textColor = .white
            masteryLabel.textColor = .white
            masteryTitleLabel.textColor = .white
        }
        else {
            self.backgroundColor = .white
            self.rubricView.backgroundColor = .white
            detailLabel.textColor = .black
            masteryLabel.textColor = .black
            masteryTitleLabel.textColor = .black
        }
    }
}
