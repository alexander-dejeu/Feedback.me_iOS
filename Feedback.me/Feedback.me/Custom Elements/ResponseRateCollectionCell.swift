//
//  ResponseRateCollectionCell.swift
//  Feedback.me
//
//  Created by Alexander Dejeu on 1/18/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import UIKit
import MBCircularProgressBar

class ResponseRateCollectionCell: UICollectionViewCell {
    @IBOutlet weak var title : UILabel!
    @IBOutlet weak var submitedLabel : UILabel!
    @IBOutlet weak var incompleteLabel : UILabel!
    @IBOutlet weak var progressBar : MBCircularProgressBarView!
    
    func styleCell(){
        progressBar.maxValue = 100
        progressBar.value = 78
        
        progressBar.progressLineWidth = 6
        progressBar.emptyLineWidth = 6
        progressBar.emptyLineColor = UIColor(red: 216.0/255.0, green: 216.0/255.0, blue: 216.0/255.0, alpha: 1.0)
        progressBar.progressColor = UIColor(red: 80.0/255.0, green: 227.0/255.0, blue: 194.0/255.0, alpha: 1.0)
        progressBar.progressStrokeColor = UIColor(red: 80.0/255.0, green: 227.0/255.0, blue: 194.0/255.0, alpha: 1.0)
        progressBar.emptyLineStrokeColor = UIColor(red: 216.0/255.0, green: 216.0/255.0, blue: 216.0/255.0, alpha: 1.0)
        
    }
}
