//
//  CreateData.swift
//  Feedback.me
//
//  Created by Alexander Dejeu on 1/17/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import Foundation
class CreateData {
    
    var communicationQuestion : Question = Question(questionType: .mastery, competency: "Communication", skills: ["All communication is timely (24 hours for email, same day for slack)", "Communication follows the proper channel - announcements and action items on email, check-ins and clarifications on slack.", "Asks for feedback, take notes of feedback, and implements changes in their performance based on feedback.", "Effective public speaker (can inform, entertain, and persuade)","Effective writer (can inform, entertain, and persuade)"])
    
    
    var productivityQuestion : Question = Question(questionType: .mastery, competency: "Productivity", skills: ["Can effectively use a calendar to plan for themselves and coordinate with others","Has a clear todo list and \"source of truth\"","Uses effective task management with clear owners, timelines, and deliverables","Effectively manages their work time and uses strategies like time blocking or pomodoros to work efficiently","Exhibits proper work-life balance in the form of eating, sleeping, and exercising enough while accomplishing their tasks."])
    
    
    var productManagementQuestion : Question = Question(questionType: .mastery, competency: "Product Management", skills: ["Does not overscope projects or phases of projects","Is a master of Git and GitHub workflows","Problem Solving, Resourcefulness, and Self-Reliance","Utilizes resources at their disposal effectively (e.g. using class time effectively, taking notes, and asking for help)","Is an effective solo programmer","Is an effective pair programming"])
    
    
    var codeCraftsmanshipQuestion : Question = Question(questionType: .mastery, competency: "Code Craftsmanship", skills: ["Code is built using a language/framework that suits the project’s goals", "Code is DRY and modular", "Variable and method names make sense and create an elegant DSL", "Code is well commented", "Code is implemented at the proper level of abstraction", "If required, code has test coverage"])
    
    func demoQuestions() -> [Question]{
        var tempArray = [communicationQuestion, productivityQuestion, productManagementQuestion, codeCraftsmanshipQuestion]
        return tempArray
    }
}
