//
//  EditProfileCard.swift
//  Feedback.me
//
//  Created by Alexander Dejeu on 1/14/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import UIKit

class EditProfileCard: UIView {
    // MARK: - IBOutlets
    @IBOutlet weak var saveButton : UIButton!
    
    var closurerToHide : (()->())? = nil
    
    func flip(){
        let transitionOptions: UIViewAnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
        
        UIView.transition(with: self, duration: 1.0, options: transitionOptions, animations: {
            self.closurerToHide!()
        })
    }
    
    func setupSave(){
        self.saveButton.addTarget(self, action: #selector(flip), for: .touchUpInside)
    }
    
    func style(){
        self.layer.borderColor = UIColor(red: 155.0/255.0, green: 155.0/255.0, blue: 155.0/255.0, alpha: 1.0).cgColor
        self.layer.borderWidth = 1
    }

}
