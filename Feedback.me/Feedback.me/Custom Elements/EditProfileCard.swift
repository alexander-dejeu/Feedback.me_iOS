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
        saveButton.layer.cornerRadius = 5
    }
    
    func style(){
        self.layer.borderColor = globalColors.boarders.cgColor
        self.layer.borderWidth = 1
    }

}
