//
//  ProfileCard.swift
//  Feedback.me
//
//  Created by Alexander Dejeu on 1/7/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import UIKit

class ProfileCard: UIView {
    //MARK: - IBOutlets
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var fullNameLabel : UILabel!
    @IBOutlet weak var userEmailLabel : UILabel!
    @IBOutlet weak var userSchoolLabel : UILabel!
    
    
    //MARK: - Properties
    var closurerToHide : (()->())? = nil
    
    
    //MARK - Helpers
    func flip(){
        let transitionOptions: UIViewAnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
        
        UIView.transition(with: self, duration: 1.0, options: transitionOptions, animations: {
            self.closurerToHide!()
        })
    }
    
    func setupEdit(){
        self.editButton.addTarget(self, action: #selector(flip), for: .touchUpInside)
        editButton.layer.cornerRadius = 5
        self.editButton.backgroundColor = globalColors.coreColor
    }
    
    func style(){
        self.layer.borderColor = globalColors.boarders.cgColor
        self.layer.borderWidth = 1
    }
    

}
