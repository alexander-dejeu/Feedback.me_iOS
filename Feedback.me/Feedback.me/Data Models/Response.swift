//
//  Response.swift
//  Feedback.me
//
//  Created by Alexander Dejeu on 1/17/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import Foundation
class Response {
    var toQuestion : Question
    var answer : Any?
    
    init(toQuestion : Question, answer : Any?){
        self.toQuestion = toQuestion
        self.answer = answer
    }
}
