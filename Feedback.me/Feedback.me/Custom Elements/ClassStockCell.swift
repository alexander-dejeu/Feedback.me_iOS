//
//  ClassStockCell.swift
//  Feedback.me
//
//  Created by Alexander Dejeu on 1/14/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import UIKit

class ClassStockCell: UITableViewCell {
    @IBOutlet weak var backgroundContainerView: UIView!
    @IBOutlet weak var classTickerLabel: UILabel!
    @IBOutlet weak var classChangeBackground : UIView!
    @IBOutlet weak var classChangeLabel : UILabel!
    @IBOutlet weak var backgroundAccentView: UIView!
    
    var closureUpdateAllTickers : (()->())? = nil
    
    func styleCell(){
        print(backgroundContainerView)
        backgroundContainerView.layer.borderColor = globalColors.boarders.cgColor
        backgroundContainerView.layer.borderWidth = 1
        self.backgroundColor = globalColors.background
    }
    
    func setupTickerTapped(){
        classChangeBackground.addTapGesture(tapNumber: 1, target: self, action: #selector(getter: closureUpdateAllTickers))
    }
}
