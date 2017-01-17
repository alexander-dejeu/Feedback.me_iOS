//
//  FormsHomeController.swift
//  Feedback.me
//
//  Created by Alexander Dejeu on 1/16/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import UIKit

class FormsHomeController: UIViewController {

    
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    // MARK: - Navigation

}

extension FormsHomeController : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "SegueFromFormsHomeToFormDetail", sender: nil)
    }
}

extension FormsHomeController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let cellWidth = (self.view.frame.width / 2) - 12
        let cellHeight = cellWidth
        print(cellWidth)
        return CGSize(width: cellWidth, height: cellHeight);
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "formCell", for: indexPath as IndexPath) as! FormCollectionCell
        return cell
    }

}
