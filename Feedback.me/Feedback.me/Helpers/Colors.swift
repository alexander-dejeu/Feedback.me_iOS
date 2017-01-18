//
//  Colors.swift
//  Feedback.me
//
//  Created by Alexander Dejeu on 1/12/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import UIKit
struct globalColors {
    static var teacher = UIColor(red: 245.0/255.0, green: 102.0/255.0, blue: 67.0/255.0, alpha: 1.0)
    static var student = UIColor(red: 0.0/255.0, green: 176.0/255.0, blue: 195.0/255.0, alpha: 1.0)
    
    static var background = UIColor(red: 251.0/255.0, green: 251.0/255.0, blue: 251.0/255.0, alpha: 1.0)
    static var makeSchool = UIColor(red: 50.0/255.0, green: 177.0/255.0, blue: 225.0/255.0, alpha: 1.0)
    
    static var boarders = UIColor(red: 151.0/255.0, green: 151.0/255.0, blue: 151.0/255.0, alpha: 1.0)
    
    static var stockRed = UIColor(red: 244.0/255.0, green: 85.0/255.0, blue: 49.0/255.0, alpha: 1.0)
    static var stockGreen = UIColor(red: 33.0/255.0, green: 206.0/255.0, blue: 153.0/255.0, alpha: 1.0)
    
    static var subjectMath = UIColor(red: 74.0/255.0, green: 144.0/255.0, blue: 226.0/255.0, alpha: 1.0)
    static var subjectHistory = UIColor(red: 208.0/255.0, green: 1.0/255.0, blue: 27.0/255.0, alpha: 1.0)
    static var subjectScience = UIColor(red: 248.0/255.0, green: 231.0/255.0, blue: 28.0/255.0, alpha: 1.0)
    static var subjectLanguage = UIColor(red: 144.0/255.0, green: 19.0/255.0, blue: 254.0/255.0, alpha: 1.0)
    static var subjectEnglish = UIColor(red: 80.0/255.0, green: 227.0/255.0, blue: 194.0/255.0, alpha: 1.0)
    static var subjectDefault = UIColor(red: 74.0/255.0, green: 144.0/255.0, blue: 226.0/255.0, alpha: 1.0)
    
    static func getAccentForClass(classSubject : subject) -> UIColor{
        switch classSubject {
        case .math:
            return subjectMath
        case .history:
            return subjectHistory
        case .science:
            return subjectScience
        case .language:
            return subjectLanguage
        case .english:
            return subjectEnglish
        default:
            return subjectDefault
        }
        
    }


}

enum subject {
    case math
    case history
    case science
    case language
    case english
    case other
}

