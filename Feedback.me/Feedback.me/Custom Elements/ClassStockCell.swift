//
//  ClassStockCell.swift
//  Feedback.me
//
//  Created by Alexander Dejeu on 1/14/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import UIKit
import ScrollableGraphView

class ClassStockCell: UITableViewCell {
    @IBOutlet weak var backgroundContainerView: UIView!
    @IBOutlet weak var classTickerLabel: UILabel!
    @IBOutlet weak var classChangeBackground : UIView!
    @IBOutlet weak var classChangeLabel : UILabel!
    @IBOutlet weak var backgroundAccentView: UIView!
    
    var data : [Double] = []
    
    func styleCell(){
        backgroundContainerView.layer.borderColor = globalColors.boarders.cgColor
        backgroundContainerView.layer.borderWidth = 1
        self.backgroundColor = globalColors.background
    }
    
    func setupTickerTapped(){
        classChangeBackground.addTapGesture(tapNumber: 1, target: self, action: #selector(self.togglePercentStar))
    }
    
    func togglePercentStar(){
        if classChangeLabel.text?.characters.first == "%"{
            classChangeLabel.text = "★ \(String(data[data.count - 1]))"
        }
        else if classChangeLabel.text?.characters.first == "★"{
            var percentageChange = 0.0
            if data[data.count - 1] > data[data.count - 2]{
                percentageChange = (1.0 - data[data.count - 2] / data[data.count - 1]) * 100.0
            }
            else{
                percentageChange = (1.0 - data[data.count - 1] / data[data.count - 2]) * 100.0
            }
            classChangeLabel.text = "% \(percentageChange.roundTo(places: 2))"
        }
    }
}

extension Double {
    /// Rounds the double to decimal places value
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
