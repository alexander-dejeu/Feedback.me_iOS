//
//  Question.swift
//  Feedback.me
//
//  Created by Alexander Dejeu on 1/17/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import Foundation
class Question {
    var questionType : type
    var competency : String
    var skills : [String]
    
    init(questionType : type, competency : String, skills : [String]){
        self.questionType = questionType
        self.competency = competency
        self.skills = skills
    }
}

enum type {
    case freeResponse
    case mastery
}
