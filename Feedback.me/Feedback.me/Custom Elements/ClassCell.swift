//
//  ClassCell.swift
//  Feedback.me
//
//  Created by Alexander Dejeu on 1/13/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import UIKit

class ClassCell: UITableViewCell {
    //MARK: - IBOutlets
    @IBOutlet weak var cellBackgroundView : UIView!
    @IBOutlet weak var cellColorHighlight : UIView!
//    @IBOutlet weak var extraDetailsView : UIView!
    @IBOutlet weak var classTitle : UILabel!
    @IBOutlet weak var classGrade : UILabel!

    
    func styleCell(){
        cellBackgroundView.backgroundColor = .white
        cellBackgroundView.layer.borderColor = globalColors.boarders.cgColor
        cellBackgroundView.layer.borderWidth = 1
    }
}
