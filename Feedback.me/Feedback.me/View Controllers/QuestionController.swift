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
    @IBOutlet weak var nextLabel : UILabel!
    @IBOutlet weak var questionScrollView: UIScrollView!
    
    
    //MARK: - Properties
    var rubric : [[String]] =
        [["0","Waiting", "Exhibits fewer than 1/2 of the key characteristics of the competency without consistency."],
    ["1","Beginning","Exhibits 1/2 of the key characteristics but without consistency."],
    ["2","Undertaking","Exhibits 1/2 of the key characteristics consistently."],
    ["3","Approaching","Exhibits more than half of the key characteristics consistently."],
    ["4","Overtaking","Exhibits all the key characteristics consistently."],
    ["5","Innovating","Innovates new ways to embody and express the competency."] ]
    var selectedLevel = -1
    var questions : [Question] = []
    var responses : [Response] = []
    var questionIndex = 0
    
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.nextTapped(_:)))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.cancelsTouchesInView = false
        tapGesture.isEnabled = true
        nextView.addGestureRecognizer(tapGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if selectedLevel == -1 {
            nextView.isHidden = true
        }
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if selectedLevel == -1 && nextView.center.x > 0 {
            nextView.center.x -= view.bounds.width
        }
    }

    
    //MARK: - Helpers
    func formatSkills(text: [String]) -> String {
        var result  = ""
        for skill in text {
            result += "• " + skill + "\n"
        }
        return result
    }
    func setupQuestion(){
        if (questionIndex < questions.count){
            competencyLabel.text = questions[questionIndex].competency
            skillsLabel.text = formatSkills(text: questions[questionIndex].skills)
        }
        else{
            self.performSegue(withIdentifier: "unwindToFormDetail", sender: nil)
        }
    }
    
    
    // MARK: - Navigation
    func nextTapped(_ sender: UITapGestureRecognizer){
        nextView.isHidden = true
        self.nextView.center.x -= self.view.bounds.width
        print(self.view.bounds.width)
        print(self.nextView.center.x)
        let cell = masteryCollectionView.cellForItem(at: IndexPath(item: selectedLevel, section: 0 )) as! MasteryCell
        cell.chosenRubric = false
        selectedLevel = -1
        cell.selectedStyle()
        
        questionScrollView.setContentOffset(CGPoint(x: 0.0, y: -64.0)  , animated: true)
        
        questionIndex += 1
        setupQuestion()
        self.nextView.center.x -= self.view.bounds.width
        print("new updated: \(nextView.center.x)")

    }
}


//MARK: - UICollectionView Delegate
extension QuestionController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if selectedLevel == -1 {
            nextView.isHidden = false
            if questionIndex > 0 {
                self.nextView.center.x -= self.view.bounds.width
            }

            UIView.animate(withDuration: 0.8, delay: 0.1,
                           usingSpringWithDamping: 1.0,
                           initialSpringVelocity: 0.5,
                           options: [], animations: {
                            self.nextView.center.x += self.view.bounds.width
            }, completion: nil)
        }
        
        if selectedLevel != -1 {
            let tempCell = masteryCollectionView.cellForItem(at: IndexPath(item: selectedLevel, section: 0 )) as! MasteryCell
            tempCell.chosenRubric = false
            tempCell.selectedStyle()
        }
        let cell = masteryCollectionView.cellForItem(at: indexPath) as! MasteryCell
        selectedLevel = indexPath.item
        cell.chosenRubric = true
        cell.selectedStyle()
        print("You selected cell #\(indexPath.item)!")
        
    }
}


//MARK: - UICollectionView DataSource
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
