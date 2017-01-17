//
//  Comment.swift
//  Feedback.me
//
//  Created by Alexander Dejeu on 1/16/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import Foundation
class Comment {
    var byUser : User
    var rating : Int
    var comment : String
    var posted : Date
    var forClass : Class
    
    init(byUser : User, rating: Int, comment : String, posted : Date, forClass : Class) {
        self.byUser = byUser
        self.rating = rating
        self.comment = comment
        self.posted = posted
        self.forClass = forClass
    }
}
