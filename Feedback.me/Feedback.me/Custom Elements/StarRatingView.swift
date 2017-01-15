//
//  StarRatingView.swift
//  Feedback.me
//
//  Created by Alexander Dejeu on 1/13/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import UIKit

class StarRatingView: UIView {

    var starWidth : CGFloat = 17.0
    var starHeight: CGFloat = 16.0
    var starSpacing : CGFloat = 2.0
    
    func addStars(rating: Int){
        clearStars()
    
        starSpacing = (self.frame.width - (starWidth * 5)) / 4.0
        
        for i in 0..<rating{
            let star = UIImage(named: "FilledOrangeStar")
            let starFrame = CGRect(x: CGFloat(i) * (starWidth + starSpacing), y: 0, width: starWidth, height: starHeight)
            let starView = UIImageView(frame: starFrame)
            starView.image = star
            
            self.addSubview(starView)
        }
    }
    
    func clearStars(){
        for view in self.subviews{
            view.removeFromSuperview()
        }
    }

}
