//
//  User.swift
//  Feedback.me
//
//  Created by Alexander Dejeu on 1/16/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import Foundation
class User {
    var fullName : String
    var profilePictureName : String
    
    var role : role
    
    init(fullName : String, profilePictureName : String, role: role) {
        self.fullName = fullName
        self.profilePictureName = profilePictureName
        self.role = role
    }
}

enum role {
    case instructor
    case student
    case admin
}
