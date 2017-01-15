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
    
    func styleCell(){
        print(backgroundContainerView)
        backgroundContainerView.layer.borderColor = UIColor.blue.cgColor
        backgroundContainerView.layer.borderWidth = 1
    }
}