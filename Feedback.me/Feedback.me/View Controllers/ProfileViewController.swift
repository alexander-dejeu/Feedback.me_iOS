//
//  ProfileViewController.swift
//  Feedback.me
//
//  Created by Alexander Dejeu on 1/7/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var userProfile: ProfileCard!
    @IBOutlet weak var classesCollectionView: UICollectionView!
    
    var items: [Class] = [Class(title: "Calculus IV", instructor: "Mrs. Steingold"), Class(title: "European History", instructor: "Mr. Jewells"), Class(title: "French III", instructor: "Mme. Wildfong")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userProfile.setupEdit()
    }
    
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let cellWidth = (self.view.frame.width / 2) - 12
        let cellHeight = cellWidth / 2.378
        return CGSize(width: cellWidth, height: cellHeight);
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
//        let cellCount = items.count
//        let cellWidth = (self.view.frame.width / 2) - 12
//        
//        
//
////        let totalCellWidth = cellWidth * cellCount
////        let totalSpacingWidth = CellSpacing * (cellCount - 1)
////        
////        let leftInset = (collectionViewWidth - CGFloat(totalCellWidth + totalSpacingWidth)) / 2;
////        let rightInset = leftInset
//        
//        return UIEdgeInsetsMake(0, 12, 0, 12)
//    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ClassCell", for: indexPath as IndexPath) as! ClassCollectionViewCell
        cell.classTitleLabel.text = items[indexPath.row].title
        cell.classInstructorLabel.text = items[indexPath.row].instructor
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
//        cell.myLabel.text = self.items[indexPath.item]
//        cell.backgroundColor = UIColor.cyan // make cell more visible in our example project
        cell.styleCell()
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }


    

    // MARK: - Navigation


}
