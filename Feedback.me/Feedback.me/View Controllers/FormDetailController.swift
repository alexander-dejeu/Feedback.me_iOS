//
//  FormDetailController.swift
//  Feedback.me
//
//  Created by Alexander Dejeu on 1/16/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import UIKit

class FormDetailController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var teacherImageView : UIImageView!
    @IBOutlet weak var teacherNameLabel : UILabel!
    @IBOutlet weak var classLabel : UILabel!
    @IBOutlet weak var sentLabel : UILabel!
    @IBOutlet weak var selfAssessementView : UIView!
    @IBOutlet weak var peerAssesementView : UIView!
    @IBOutlet weak var teacherAssesementView : UIView!
    @IBOutlet weak var selfLabel : UILabel!
    @IBOutlet weak var peerLabel : UILabel!
    @IBOutlet weak var teacherLabel : UILabel!
    @IBOutlet weak var scrollView : UIScrollView!
    @IBOutlet weak var formHeaderBackgroundView : UIView!
    @IBOutlet weak var checkboxLabel : UILabel!
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
//        self.title = "MA 1024"
        super.viewDidLoad()
        checkboxLabel.isHidden = true
        styleCards()
        formHeaderBackgroundView.layer.borderWidth = 1
        formHeaderBackgroundView.layer.borderColor = globalColors.boarders.cgColor
        scrollView.backgroundColor = globalColors.background
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapCard(_:)))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.cancelsTouchesInView = false
        tapGesture.isEnabled = true

        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(self.tapCard(_:)))
        tapGesture2.numberOfTapsRequired = 1
        tapGesture2.cancelsTouchesInView = false
        tapGesture2.isEnabled = true
        
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(self.tapCard(_:)))
        tapGesture3.numberOfTapsRequired = 1
        tapGesture3.cancelsTouchesInView = false
        tapGesture3.isEnabled = true
        
        selfAssessementView.addGestureRecognizer(tapGesture)
        peerAssesementView.addGestureRecognizer(tapGesture2)
        teacherAssesementView.addGestureRecognizer(tapGesture3)
    }
    
    // MARK: - Navigation
    func tapCard(_ sender: UITapGestureRecognizer){
        print("pls jappe")
        self.performSegue(withIdentifier: "segueFromFormDetailsToQuestions", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "segueFromFormDetailsToQuestions"){
            let DestViewController = segue.destination as! QuestionController
            let getData = CreateData()
            let data = getData.demoQuestions()
            DestViewController.questions = data
        }
    }
    
    @IBAction func unwindToFormDetail(segue : UIStoryboardSegue){
        print("yeee we unwinded")
        checkboxLabel.isHidden = false
    }

    
    
    //MARK: - Helpers
    func styleCards(){
        self.selfAssessementView.layer.borderColor = globalColors.boarders.cgColor
        self.selfAssessementView.layer.borderWidth = 1
        
        self.peerAssesementView.layer.borderColor = globalColors.boarders.cgColor
        self.peerAssesementView.layer.borderWidth = 1
        
        self.teacherAssesementView.layer.borderColor = globalColors.boarders.cgColor
        self.teacherAssesementView.layer.borderWidth = 1
    }

}
