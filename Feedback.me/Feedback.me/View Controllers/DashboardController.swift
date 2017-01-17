//
//  DashboardController.swift
//  Feedback.me
//
//  Created by Alexander Dejeu on 1/13/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import UIKit

class DashboardController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var segmentedController : UISegmentedControl!
    @IBOutlet weak var dashboardTableView: UITableView!
    @IBOutlet weak var dashboardCollectionView: UICollectionView!
    
    
    var commentsData : [Comment] = []
    //MARK: - IBActions
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            dashboardCollectionView.isHidden = false
            dashboardTableView.isHidden = true
        case 1:
            dashboardTableView.isHidden = false
            dashboardCollectionView.isHidden = true
            dashboardTableView.reloadData()
        case 2:
            dashboardTableView.isHidden = false
            dashboardCollectionView.isHidden = true
            dashboardTableView.reloadData()
        default:
            print("yikes")
        }
    }
    
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        dashboardTableView.separatorStyle = .none
        dashboardTableView.tableFooterView = UIView()
        dashboardTableView.estimatedRowHeight = 250
        dashboardTableView.rowHeight = UITableViewAutomaticDimension
        
        commentsData = createComments()
    }

    
    
    // MARK: - Navigation
    
    //MARK: - Helpers
    func createComments() -> [Comment]{
        let user1 = User(fullName : "Alexander Dejeu", profilePictureName : "profile1", role: .student)
        let user2 = User(fullName : "Samual Adams", profilePictureName : "profile1", role: .student)
        let user3 = User(fullName : "Adam Braus", profilePictureName : "profile1", role: .student)
        let user4 = User(fullName : "Kenny Batista", profilePictureName : "profile1", role: .student)
        
        let teacher1 = User(fullName : "Mrs. Steingold", profilePictureName : "profile1", role: .instructor)
        let teacher2 = User(fullName : "Mr. Jewells", profilePictureName : "profile2", role: .instructor)
        let teacher3 = User(fullName : "Mme. Wildfong", profilePictureName : "profile1", role: .instructor)
        
        let class1 = Class(fullTitle : "French III", tickerTitle: "FL 2013", instructor : teacher3)
        let class2 = Class(fullTitle : "Calculus II", tickerTitle: "MA 1022", instructor : teacher2)
        let class3 = Class(fullTitle : "American History", tickerTitle: "HI 2242", instructor : teacher1)
        
        let date = Date()
        let date1 = Date(timeInterval: -1000, since: date)
        let date2 = Date(timeInterval: -10000, since: date)
        let date3 = Date(timeInterval: -100000, since: date)
        let date4 = Date(timeInterval: -40000, since: date)
        
        return [Comment(byUser : user1, rating: 4, comment : "Wow much wow!", posted : date1, forClass : class2),
                Comment(byUser : user2, rating: 5, comment : "Loads and aloads of text, wow look at all od this text many manny mannnny times.Loads and aloads of text, wow look at all od this text many manny mannnny times. Loads and aloads of text, wow look at all od this text many manny mannnny times. Loads and aloads of text, wow look at all od this text many manny mannnny times.", posted : date2, forClass : class1),
                Comment(byUser : user3, rating: 2, comment : "Good: Really good class engagement this week with the podcasts. Better: Maybe try to speak up more?  I found that it hard to hear you in the back of class. Best: Great!", posted : date3, forClass : class3),
                Comment(byUser : user4, rating: 1, comment : "Great attitude this week!", posted : date4, forClass : class3)]

    }

}

extension DashboardController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch segmentedController.selectedSegmentIndex {
        case 1:
            return 8
        case 2:
            return commentsData.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch segmentedController.selectedSegmentIndex {
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "classStockCell") as! ClassStockCell
            cell.styleCell()
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "feedbackCell") as! FeedbackCell
            cell.styleCell()
            let comment = commentsData[indexPath.row]
            
            cell.imageView?.image = UIImage(named: comment.byUser.profilePictureName)
            cell.ratingView.addStars(rating: comment.rating)
            cell.postedAgo.text = comment.posted.description
            cell.feedbackLabel.text = comment.comment
            cell.fromClassLabel.text = comment.forClass.tickerTitle
            cell.postedByLabel.text = comment.byUser.fullName
            return cell
        default:
            print(#function, "Did not find proper Cells")
            return UITableViewCell()
        }
    }
}

extension DashboardController  : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch segmentedController.selectedSegmentIndex {
        case 1:
            return 98
        case 2:
            return UITableViewAutomaticDimension;
        default:
            print(#function, "Did not find proper Cells")
            return 75
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch segmentedController.selectedSegmentIndex {
        case 1:
            return 8
        case 2:
            return 12
        default:
            print(#function, "Did not find proper Cells")
            return 75
        }
    }
}
