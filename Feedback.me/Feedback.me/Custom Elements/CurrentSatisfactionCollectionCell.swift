//
//  CurrentSatisfactionCollectionCell.swift
//  Feedback.me
//
//  Created by Alexander Dejeu on 1/18/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import UIKit

class CurrentSatisfactionCollectionCell: UICollectionViewCell {
    //MARK: - IBOutlets
    @IBOutlet weak var currentSatisfactionLabel : UILabel!
    @IBOutlet weak var currentPercentageChangeLabel : UILabel!
    @IBOutlet weak var lastUpdatedLabel : UILabel!
    
    
    //MARK: - Helpers
    func styleCell(){
        self.layer.borderWidth = 1
        self.layer.borderColor = globalColors.boarders.cgColor
    }
    
}
