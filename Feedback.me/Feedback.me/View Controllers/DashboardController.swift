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
    }

    
    // MARK: - Navigation

}

extension DashboardController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch segmentedController.selectedSegmentIndex {
        case 1:
            return 8
        case 2:
            return 5
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
            return 233
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
