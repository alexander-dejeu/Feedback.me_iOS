//
//  Class.swift
//  Feedback.me
//
//  Created by Alexander Dejeu on 1/7/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import Foundation
class Class {
    var fullTitle : String
    var tickerTitle : String
    var instructor : User
    
    init(fullTitle : String, tickerTitle: String, instructor : User) {
        self.fullTitle = fullTitle
        self.tickerTitle = tickerTitle
        self.instructor = instructor
    }
}
