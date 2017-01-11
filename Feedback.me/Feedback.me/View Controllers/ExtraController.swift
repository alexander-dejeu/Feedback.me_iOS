//
//  ExtraController.swift
//  Feedback.me
//
//  Created by Alexander Dejeu on 1/10/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import UIKit

class ExtraController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: - IBOutlets
    @IBOutlet weak var tableView : UITableView!
    
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var customMakeSchoolFooter = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        var versionLabel : UILabel = UILabel(frame: CGRect(x: 32, y: 16, width: self.view.frame.width-64, height: 22))
        var makeSchoolShoutoutLabel : UILabel = UILabel(frame: CGRect(x: 32, y: 16 + 5 + versionLabel.frame.height, width: self.view.frame.width-64, height: 20))
        
        versionLabel.textAlignment = .center
        versionLabel.text = "Version 1.0"
        makeSchoolShoutoutLabel.textAlignment = .center
        makeSchoolShoutoutLabel.text = ""
        var makeSchoolLabelString = NSMutableAttributedString(string: "Made with ♥ at Make School in San Francisco", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 15)])
    
//        makeSchoolLabelString.addAttribute(<#T##name: String##String#>, value: <#T##Any#>, range: <#T##NSRange#>)
//        addAttribute(NSForegroundColorAttributeName, value: UIColor.red , range: range
        makeSchoolLabelString.addAttribute(NSForegroundColorAttributeName, value: UIColor(red: 50.0/255.0, green: 177.0/255.0, blue: 225.0/255.0, alpha: 1.0), range: NSRange(location:15,length:11))
        
        makeSchoolLabelString.addAttribute(NSForegroundColorAttributeName, value: UIColor(red: 249.0/255.0, green: 124.0/255.0, blue: 84.0/255.0, alpha: 1.0), range: NSRange(location:10,length:1))
        
        makeSchoolShoutoutLabel.attributedText = makeSchoolLabelString
        makeSchoolShoutoutLabel.minimumScaleFactor = 0.5
        makeSchoolShoutoutLabel.adjustsFontSizeToFitWidth = true
        makeSchoolShoutoutLabel.lineBreakMode = .byTruncatingTail
        
        customMakeSchoolFooter.addSubview(makeSchoolShoutoutLabel)
        customMakeSchoolFooter.addSubview(versionLabel)
        

//        myMutableString = NSMutableAttributedString(string: myString, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 18.0)!])
//
//        myMutableString.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor(), range: NSRange(location:2,length:4))
        
        // set label Attribute
        
//        labName.attributedText = myMutableString
        
//        customMakeSchoolFooter.backgroundColor = .orange
        self.tableView.tableFooterView = customMakeSchoolFooter
    }
    
    
    //MARK: - Tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    

    // MARK: - Navigation

}
