//
//  FormCollectionCell.swift
//  Feedback.me
//
//  Created by Alexander Dejeu on 1/16/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import UIKit

class FormCollectionCell: UICollectionViewCell {
    //MARK: - IBOutlets
    @IBOutlet weak var forClassLabel : UILabel!
    @IBOutlet weak var sentLabel : UILabel!
    @IBOutlet weak var accentView : UIView!
    
    
    //MARK: - Helpers
    func styleCell(){
        self.layer.borderColor = globalColors.boarders.cgColor
        self.layer.borderWidth = 1
        self.backgroundColor = .white
    }
}
