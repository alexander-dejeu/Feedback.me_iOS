//
//  Form.swift
//  Feedback.me
//
//  Created by Alexander Dejeu on 1/16/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import Foundation
class Form {
    var questions : [Question]
    var title : String
    
    init(questions : [Question], title : String){
        self.questions = questions
        self.title = title
    }
}
