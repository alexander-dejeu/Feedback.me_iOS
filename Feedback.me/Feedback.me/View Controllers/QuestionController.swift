//
//  QuestionController.swift
//  Feedback.me
//
//  Created by Alexander Dejeu on 1/16/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import UIKit

class QuestionController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var competencyLabel: UILabel!
    @IBOutlet weak var skillsLabel : UILabel!
    @IBOutlet weak var masteryCollectionView : UICollectionView!
    @IBOutlet weak var nextView : UIView!
    
    var rubric : [[String]] =
        [["0","Waiting", "Exhibits fewer than 1/2 of the key characteristics of the competency without consistency."],
    ["1","Beginning","Exhibits 1/2 of the key characteristics but without consistency."],
    ["2","Undertaking","Exhibits 1/2 of the key characteristics consistently."],
    ["3","Approaching","Exhibits more than half of the key characteristics consistently."],
    ["4","Overtaking","Exhibits all the key characteristics consistently."],
    ["5","Innovating","Innovates new ways to embody and express the competency."] ]
    
    
    
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        nextView.center.x -= view.bounds.width
    }

    // MARK: - Navigation

}

extension QuestionController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
        UIView.animate(withDuration: 0.8, delay: 0.1,
                                   usingSpringWithDamping: 1.0,
                                   initialSpringVelocity: 0.5,
                                   options: [], animations: {
                                    self.nextView.center.x += self.view.bounds.width
        }, completion: nil)
    }
}

extension QuestionController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.rubric.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let cellWidth = (self.view.frame.width / 2) - 12
        let cellHeight = cellWidth
        print(cellWidth)
        return CGSize(width: cellWidth, height: cellHeight);
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "masteryCell", for: indexPath as IndexPath) as! MasteryCell
        cell.masteryLabel.text = rubric[indexPath.item][0]
        cell.masteryTitleLabel.text = rubric[indexPath.item][1]
        cell.detailLabel.text = rubric[indexPath.item][2]
        cell.styleCell()
        return cell
    }
}
