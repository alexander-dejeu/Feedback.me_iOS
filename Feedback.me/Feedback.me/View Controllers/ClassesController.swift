//
//  ClassesController.swift
//  Feedback.me
//
//  Created by Alexander Dejeu on 1/13/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import UIKit

class ClassesController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var classroomData : [Class] = []
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Classrooms"
        classroomData = getAllClasses()
    }
    
    
    //MARK: - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classroomData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "classCell", for: indexPath) as! ClassCell
        cell.cellColorHighlight.backgroundColor = globalColors.getAccentForClass(classSubject: classroomData[indexPath.row].classSubject)
        cell.classTitle.text = classroomData[indexPath.row].fullTitle
        cell.classGrade.text = classroomData[indexPath.row].instructor.fullName
        
        cell.styleCell()
        
        return cell
    }
    
    func getAllClasses() -> [Class]{
        var results : [Class] = []
            
            let teacher1 = User(fullName : "Mrs. Steingold", profilePictureName : "users-15", role: .instructor)
            let teacher2 = User(fullName : "Mr. Jewells", profilePictureName : "users-15", role: .instructor)
            let teacher3 = User(fullName : "Mme. Wildfong", profilePictureName : "users-15", role: .instructor)
            let teacher4 = User(fullName : "Mr. Braus", profilePictureName : "users-15", role: .instructor)
            let teacher5 = User(fullName : "Mr. Ludt", profilePictureName : "users-15", role: .instructor)
            
            let class1 = Class(fullTitle : "French III", tickerTitle: "FL 2013", instructor : teacher3, classSubject: .language)
            let class2 = Class(fullTitle : "Calculus II", tickerTitle: "MA 1022", instructor : teacher2, classSubject: .math)
            let class3 = Class(fullTitle : "American History", tickerTitle: "HI 2242", instructor : teacher1, classSubject: .history)
            let class4 = Class(fullTitle : "Computer Science", tickerTitle: "CS 1102", instructor : teacher4, classSubject: .science)
            let class5 = Class(fullTitle : "Twain English", tickerTitle: "EN 3404", instructor : teacher5, classSubject: .english)
        
        results = [class1, class2, class3,class4,class5]
        
        return results
    }
    
    // MARK: - Navigation


}
