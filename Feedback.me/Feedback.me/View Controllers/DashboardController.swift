//
//  DashboardController.swift
//  Feedback.me
//
//  Created by Alexander Dejeu on 1/13/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import UIKit
import ScrollableGraphView
import MBCircularProgressBar

class DashboardController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var segmentedController : UISegmentedControl!
    @IBOutlet weak var dashboardTableView: UITableView!
    @IBOutlet weak var dashboardCollectionView: UICollectionView!
    
    
    //MARK: - Properties
    var commentsData : [Comment] = []
    var classesData : [Class] = []
    var staticData : [[Double]] = []
    
    
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
        staticData = [[4.3,2.6,2.8,4.9,4.72],[3.2,3.2,3.2,3.1,3.58],[3.3,3.8,3.6,4.6,4.04],[1.8,3.5,3.5,2.8,4.28], [2.1,4.2,3.1,2.2, 3.86]]

        dashboardTableView.separatorStyle = .none
        dashboardTableView.tableFooterView = UIView()
        dashboardTableView.estimatedRowHeight = 250
        dashboardTableView.rowHeight = UITableViewAutomaticDimension
        
        commentsData = createComments()
        classesData = createClasses()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let indexPath = NSIndexPath(item: 2, section: 0)
        let responseRateCell = dashboardCollectionView.dequeueReusableCell(withReuseIdentifier:  "ResponseRate", for: indexPath as IndexPath) as! ResponseRateCollectionCell
        print(responseRateCell)
        let animator2 = responseRateCell.progressBar as? MBCircularProgressBarView
        animator2?.value = 20

        UIView.animate(withDuration: 1.0, animations: {() -> Void in
            let animator = responseRateCell.progressBar as? MBCircularProgressBarView
            animator?.value = 55
            animator?.emptyLineColor = .blue
            print("ehh")
        })
    }

    
    //MARK: - Helpers
    func createComments() -> [Comment]{
        let user1 = User(fullName : "Alexander Dejeu", profilePictureName : "users-15", role: .student)
        let user2 = User(fullName : "Sally White", profilePictureName : "users-16", role: .student)
        let user3 = User(fullName : "Adam Braus", profilePictureName : "users-17", role: .student)
        let user4 = User(fullName : "Kenny Batista", profilePictureName : "users-18", role: .student)
        
        let teacher1 = User(fullName : "Mrs. Steingold", profilePictureName : "users-16", role: .instructor)
        let teacher2 = User(fullName : "Mr. Jewells", profilePictureName : "users-15", role: .instructor)
        let teacher3 = User(fullName : "Mme. Wildfong", profilePictureName : "users-17", role: .instructor)
        let teacher4 = User(fullName : "Mme. Wildfong", profilePictureName : "users-18", role: .instructor)
        
        let class1 = Class(fullTitle : "French III", tickerTitle: "FL 2013", instructor : teacher3, classSubject: .language)
        let class2 = Class(fullTitle : "Calculus II", tickerTitle: "MA 1022", instructor : teacher2, classSubject: .math)
        let class3 = Class(fullTitle : "American History", tickerTitle: "HI 2242", instructor : teacher1, classSubject: .history)
        let class4 = Class(fullTitle : "Computer Science", tickerTitle: "CS 4042", instructor : teacher4, classSubject: .history)
        
        let date = Date()
        let date1 = Date(timeInterval: -1000, since: date)
        let date2 = Date(timeInterval: -10000, since: date)
        let date3 = Date(timeInterval: -100000, since: date)
        let date4 = Date(timeInterval: -100000, since: date)
        
        return [Comment(byUser : user1, rating: 4, comment : "I really loved how we used whiteboards in class this week to model different mathematical models!", posted : date1, forClass : class2),
                Comment(byUser : user2, rating: 5, comment : "This week I thought you did really well outlining our class objectivies. I think one area you could improve on though is being more flexible, last week we were having a spectacular tangent, but you killed it because we 'had' to only do the learning objectives. Loosen up!", posted : date2, forClass : class1),
                Comment(byUser : user3, rating: 2, comment : "Good: Really good class engagement this week with the podcasts. \n\nBetter: Maybe try to speak up more?  I found that it hard to hear you in the back of class. \n\nBest: Loved the movie we watched in class!", posted : date3, forClass : class3),
                Comment(byUser : user4, rating: 4, comment : "Great attitude this week!", posted : date4, forClass : class4)]

    }
    
    func createClasses() -> [Class]{
        var results : [Class] = []
        let teacher1 = User(fullName : "Mrs. Steingold", profilePictureName : "users-15", role: .instructor)
        let teacher2 = User(fullName : "Mr. Jewells", profilePictureName : "users-15", role: .instructor)
        let teacher3 = User(fullName : "Mme. Wildfong", profilePictureName : "users-15", role: .instructor)
        
        let class1 = Class(fullTitle : "French III", tickerTitle: "FL 2013", instructor : teacher3, classSubject: .language)
        let class2 = Class(fullTitle : "Calculus II", tickerTitle: "MA 1022", instructor : teacher2, classSubject: .math)
        let class3 = Class(fullTitle : "American History", tickerTitle: "HI 2242", instructor : teacher1, classSubject: .history)
        let class4 = Class(fullTitle : "Computer Science", tickerTitle: "CS 1102", instructor : teacher2, classSubject: .science)
        let class5 = Class(fullTitle : "Twain English", tickerTitle: "EN 3404", instructor : teacher1, classSubject: .english)
        results = [class1,class2,class3,class4,class5]
        return results
    }

}


//MARK: - UITableview DataSource
extension DashboardController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch segmentedController.selectedSegmentIndex {
        case 1:
            return classesData.count
        case 2:
            return commentsData.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch segmentedController.selectedSegmentIndex {
        case 1:
            let data: [Double] = staticData[indexPath.row]
            var isImproving : Bool = false
            var dataColor = globalColors.stockRed
            
            if data[data.count-1] > data[data.count-2]{
                isImproving = true
                dataColor = globalColors.stockGreen
            }
            
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "classStockCell") as! ClassStockCell
            let startingX = cell.classTickerLabel.frame.width + cell.classTickerLabel.frame.origin.x
            let endingX = cell.classChangeBackground.frame.origin.x
            
            let chartCenterX = startingX + (endingX - startingX)/2
            let chartCenterY = cell.classTickerLabel.center.y
            
            
            let graphView = ScrollableGraphView(frame: CGRect(x: 0, y: 0, width: 70, height: 40))
            graphView.center = CGPoint(x: chartCenterX-20, y: chartCenterY)
            graphView.lineWidth = 1
            graphView.rangeMax = 5
            graphView.rangeMin = 2.5
            graphView.dataPointSize = 1.5
            graphView.dataPointSpacing = 6
            graphView.shouldAddLabelsToIntermediateReferenceLines = false
            graphView.shouldShowReferenceLines = false
            graphView.leftmostPointPadding = 5
            graphView.rightmostPointPadding = 5
            graphView.topMargin = 0
            graphView.bottomMargin = 0
            graphView.animationDuration = 0.1
            graphView.backgroundColor = .clear
            
            graphView.dataPointFillColor = dataColor
            graphView.lineColor = dataColor
            
            cell.classChangeBackground.backgroundColor = dataColor
            cell.classChangeBackground.layer.cornerRadius = 5
            cell.classChangeLabel.text = "★ \(String(data[data.count - 1]))"
            
            cell.setupTickerTapped() 
            
            cell.data = data
            
            print(graphView.center)
            print(graphView.frame)
            cell.classTickerLabel.text = classesData[indexPath.row].tickerTitle
            cell.backgroundAccentView.backgroundColor = globalColors.getAccentForClass(classSubject: classesData[indexPath.row].classSubject)
        
            graphView.set(data: data, withLabels: [])
            cell.backgroundContainerView.addSubview(graphView)
            
            cell.styleCell()
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "feedbackCell") as! FeedbackCell
            cell.styleCell()
            let comment = commentsData[indexPath.row]
            

            let imageView = UIImageView(frame: CGRect(x: 16, y: 28, width: 50, height: 50))
            imageView.image = UIImage(named: comment.byUser.profilePictureName)
            cell.contentView.addSubview(imageView)
            
            cell.ratingView.addStars(rating: comment.rating)
            cell.postedAgo.text = cell.formatDate(date: comment.posted)
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


//MARK: - UITableview Delegate
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


//MARK: - UICollectionView DataSource
extension DashboardController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        if indexPath.item == 2 {
            return CGSize(width: self.view.frame.width-16, height: 160);
        }
        let cellWidth = (self.view.frame.width / 2) - 12
        let cellHeight = cellWidth * 1.57
        return CGSize(width: cellWidth, height: cellHeight);
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.item {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CurrentSatisfaction", for: indexPath as IndexPath) as! CurrentSatisfactionCollectionCell
            
            cell.styleCell()
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ResponseRate", for: indexPath as IndexPath) as! ResponseRateCollectionCell
            
            cell.styleCell()
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LifetimeSatisfaction", for: indexPath as IndexPath)
            
            cell.contentView.layer.borderColor = globalColors.boarders.cgColor
            cell.contentView.layer.borderWidth = 1
            let graphView = ScrollableGraphView(frame: CGRect(x: 4, y: 2, width: cell.contentView.frame.width-8, height: cell.contentView.frame.height-100))
            graphView.shouldDrawBarLayer = true
            graphView.shouldDrawDataPoint = false
            graphView.lineColor = .clear
            
            graphView.lineWidth = 1
            graphView.rangeMax = 5
            graphView.rangeMin = 0
            graphView.dataPointSpacing = 25
            graphView.shouldAddLabelsToIntermediateReferenceLines = false
            graphView.shouldShowReferenceLines = false
            graphView.leftmostPointPadding = 8
            graphView.rightmostPointPadding = 8
            graphView.topMargin = 8
            graphView.bottomMargin = 0
            graphView.animationDuration = 0.3
            graphView.barWidth = 20
            graphView.barLineWidth = 0
            graphView.barColor = UIColor(red: 80.0/255.0, green: 227.0/255.0, blue: 194.0/255.0, alpha: 1.0)
            graphView.barLineColor = UIColor(red: 80.0/255.0, green: 227.0/255.0, blue: 194.0/255.0, alpha: 1.0)
            graphView.backgroundColor = .clear
            graphView.shouldShowLabels = true
            graphView.dataPointLabelTopMargin = 0
            graphView.dataPointLabelBottomMargin = 10
            
            
            let data = [3.9,4.6,4.7,4.8,   3.3,3.0,4.25,4.4,   3.9,4.6,4.7,4.8,   4.2,3.1,2.8,3.6]
            let labels = ["","October","","",    "","Novemeber","","",   "","December","","",  "","January","",""]
            graphView.set(data: data, withLabels: labels)
            
            print(graphView.frame)
            cell.addSubview(graphView)
            
            return cell
        default:
            print("default")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LifetimeSatisfaction", for: indexPath as IndexPath)
            
            //            cell.styleCell()
            return cell
           
        }
    }
}

