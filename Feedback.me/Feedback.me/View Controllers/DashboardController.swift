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
    
    @IBOutlet weak var tableViewContainer: UIView!
    
    @IBOutlet weak var collectionViewContainer: UIView!
    
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            collectionViewContainer.isHidden = false
            tableViewContainer.isHidden = true
        case 1:
            tableViewContainer.isHidden = false
            collectionViewContainer.isHidden = true
        case 2:
            tableViewContainer.isHidden = false
            collectionViewContainer.isHidden = true
            
        default:
            print("yikes")
        }
    }
    
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    // MARK: - Navigation

}
