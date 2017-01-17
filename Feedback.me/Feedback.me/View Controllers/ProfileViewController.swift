//
//  ProfileViewController.swift
//  Feedback.me
//
//  Created by Alexander Dejeu on 1/7/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    //MARK: - IBOutlets
    @IBOutlet weak var userProfile: ProfileCard!
    @IBOutlet weak var editProfile: EditProfileCard!
    @IBOutlet weak var classesCollectionView: UICollectionView!
    
    
    //MARK: - Properties
    var items: [Class] = [Class(fullTitle: "Calculus IV", tickerTitle: "CALC 1024", instructor: User(fullName : "Mrs. Steingold", profilePictureName : "profile1", role: .instructor)),
                          Class(fullTitle: "European History", tickerTitle: "CALC 1024", instructor: User(fullName : "Mr. Jewells", profilePictureName : "profile2", role: .instructor)),
                          Class(fullTitle: "French III", tickerTitle: "CALC 1024", instructor: User(fullName : "Mme. Wildfong", profilePictureName : "profile1", role: .instructor))]
    
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userProfile.setupEdit()
        self.userProfile.style()
        self.editProfile.setupSave()
        self.editProfile.style()
        self.editProfile.closurerToHide = hideEditProfile
        self.userProfile.closurerToHide = hideUserProfile
        self.editProfile.isHidden = true
        classesCollectionView.backgroundColor = globalColors.background
    }
    
    func hideUserProfile(){
        print("hide user profie")
        self.editProfile.isHidden = false
        self.userProfile.isHidden = true
        let transitionOptions: UIViewAnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
        
        UIView.transition(with: editProfile, duration: 1.0, options: transitionOptions, animations: {
        })

    }
    func hideEditProfile(){
        print("hide edit profie")
        self.editProfile.isHidden = true
        self.userProfile.isHidden = false
        let transitionOptions: UIViewAnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
        
        UIView.transition(with: userProfile, duration: 1.0, options: transitionOptions, animations: {
        })
    }
    
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.items.count % 2 == 0 {
            return self.items.count
        }
        if section == 0 {
            return self.items.count - 1
        }
        return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if self.items.count % 2 == 1 {
            return 2
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let cellWidth = (self.view.frame.width / 2) - 12
        let cellHeight = cellWidth / 2.378
        return CGSize(width: cellWidth, height: cellHeight);
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
    
        if section == 0 {
             return UIEdgeInsetsMake(8, 8, 8, 8)
        }
        else{
             return UIEdgeInsetsMake(8, 12, 8, 12)
        }
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ClassCell", for: indexPath as IndexPath) as! ClassCollectionViewCell
        cell.classTitleLabel.text = items[indexPath.row].fullTitle
        cell.classInstructorLabel.text = items[indexPath.row].instructor.fullName
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
//        cell.myLabel.text = self.items[indexPath.item]
//        cell.backgroundColor = UIColor.cyan // make cell more visible in our example project
        cell.styleCell()
        cell.fitLabels()
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }


    

    // MARK: - Navigation


}
