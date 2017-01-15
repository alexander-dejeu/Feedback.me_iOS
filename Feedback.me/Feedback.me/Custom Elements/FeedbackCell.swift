//
//  FeedbackCell.swift
//  Feedback.me
//
//  Created by Alexander Dejeu on 1/14/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import UIKit

class FeedbackCell: UITableViewCell {
    //MARK : - IBOutlets
    @IBOutlet weak var backgroundContainerView : UIView!
    @IBOutlet weak var userProfileImage : UIImageView!
    @IBOutlet weak var ratingView : StarRatingView!
    @IBOutlet weak var fromClassLabel : UILabel!
    @IBOutlet weak var feedbackLabel : UILabel!
    @IBOutlet weak var postedAgo : UILabel!
    
    func styleCell(){
        backgroundContainerView.layer.borderColor = globalColors.boarders.cgColor
        backgroundContainerView.layer.borderWidth = 1
    }
}
