//
//  FormsHomeController.swift
//  Feedback.me
//
//  Created by Alexander Dejeu on 1/16/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import UIKit

class FormsHomeController: UIViewController {

    @IBOutlet weak var formsScrollView: UIScrollView!

    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        formsScrollView.backgroundColor = globalColors.background
        self.title = "Forms"
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
        cell.styleCell()
        var formClassesData = ["MA 1024", "HI 2036", "EN 1010"]
        var formSentData = ["Sent: 01/17/17", "Sent: 01/14/17", "Sent: 01/13/17"]
        cell.forClassLabel.text = formClassesData[indexPath.row]
        cell.sentLabel.text = formSentData[indexPath.row]
        return cell
    }

}
