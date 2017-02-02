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
    @IBOutlet weak var fullNameTextField : UITextField!
    @IBOutlet weak var emailTextField : UITextField!
    @IBOutlet weak var passwordTextField : UITextField!
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var emailLabel : UILabel!
    @IBOutlet weak var passwordLabel : UILabel!
    
    
    //MARK: - Properties
    var closurerToHide : (()->())? = nil
    
    
    //MARK: - Helpers
    func flip(){
        let transitionOptions: UIViewAnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
        
        UIView.transition(with: self, duration: 1.0, options: transitionOptions, animations: {
            self.closurerToHide!()
        })
    }
    
    func setupSave(){
        self.saveButton.addTarget(self, action: #selector(flip), for: .touchUpInside)
        saveButton.layer.cornerRadius = 5
        self.saveButton.backgroundColor = globalColors.coreColor
    }
    
    func style(){
        self.layer.borderColor = globalColors.boarders.cgColor
        self.layer.borderWidth = 1
        nameLabel.textColor = globalColors.coreColor
        emailLabel.textColor = globalColors.coreColor
        passwordLabel.textColor = globalColors.coreColor
    }

}
