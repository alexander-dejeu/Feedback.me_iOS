//
//  Utilities.swift
//  Feedback.me
//
//  Created by Alexander Dejeu on 1/15/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import UIKit
class Utilities {

}


//MARK - Add Tap Gestures to Views
extension UIView {
    
    func addTapGesture(tapNumber : Int, target: Any , action : Selector) {
        
        let tap = UITapGestureRecognizer(target: target, action: action)
        tap.numberOfTapsRequired = tapNumber
        addGestureRecognizer(tap)
        isUserInteractionEnabled = true
        
    }
}
