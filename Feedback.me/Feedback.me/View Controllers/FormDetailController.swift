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
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        styleCards()
        
//        scrollView.backgroundColor = globalColors.background
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
