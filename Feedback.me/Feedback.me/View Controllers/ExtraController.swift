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
    @IBOutlet weak var settingsTableView : UITableView!
    
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = globalColors.background
        
        self.settingsTableView.backgroundColor = globalColors.background
        self.settingsTableView.sectionHeaderHeight = 24
        self.settingsTableView.tableFooterView = createMakeSchoolFooterView()
    }
    
    
    //MARK: - Tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1:
            return 1
        default:
            return 1
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 24))
        view.backgroundColor = globalColors.background
        
        let lineTop = UIView(frame: CGRect(x: 16, y: 0, width: self.view.frame.width-16, height: (1.0 / UIScreen.main.scale)))
        let lineBottom = UIView(frame: CGRect(x: 16, y: 24, width: self.view.frame.width-16, height: (1.0 / UIScreen.main.scale)))
        lineBottom.backgroundColor = self.settingsTableView.separatorColor
        lineTop.backgroundColor = self.settingsTableView.separatorColor
        if(section == 0){
            view.addSubview(lineBottom)
        }
        else{
            view.addSubview(lineTop)
            view.addSubview(lineBottom)
        }
        return view
    }
    
    
    //MARK: - Helpers
    func createMakeSchoolFooterView() -> UIView {
        let customMakeSchoolFooter = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 329))
        let lineTop = UIView(frame: CGRect(x: 16, y: 0, width: self.view.frame.width-16, height: (1.0 / UIScreen.main.scale)))
        lineTop.backgroundColor = self.settingsTableView.separatorColor
        
        customMakeSchoolFooter.backgroundColor = globalColors.background
        let versionLabel : UILabel = UILabel(frame: CGRect(x: 32, y: 16, width: self.view.frame.width-64, height: 22))
        let makeSchoolShoutoutLabel : UILabel = UILabel(frame: CGRect(x: 32, y: 16 + 5 + versionLabel.frame.height, width: self.view.frame.width-64, height: 20))
        
        let versionlLabelString = NSMutableAttributedString(string: "Version 1.0", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 17)])
        let makeSchoolLabelString = NSMutableAttributedString(string: "Made with ♥ at Make School in San Francisco", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 15)])
        makeSchoolLabelString.addAttribute(NSForegroundColorAttributeName, value: globalColors.makeSchool, range: NSRange(location:15,length:11))
        makeSchoolLabelString.addAttribute(NSForegroundColorAttributeName, value: globalColors.teacher, range: NSRange(location:10,length:1))
        
        versionLabel.textAlignment = .center
        versionLabel.attributedText = versionlLabelString
        makeSchoolShoutoutLabel.textAlignment = .center
        makeSchoolShoutoutLabel.attributedText = makeSchoolLabelString
        makeSchoolShoutoutLabel.minimumScaleFactor = 0.5
        makeSchoolShoutoutLabel.adjustsFontSizeToFitWidth = true
        makeSchoolShoutoutLabel.lineBreakMode = .byTruncatingTail
        
        customMakeSchoolFooter.addSubview(makeSchoolShoutoutLabel)
        customMakeSchoolFooter.addSubview(versionLabel)
        customMakeSchoolFooter.addSubview(lineTop)
        
        return customMakeSchoolFooter
    }

    // MARK: - Navigation

}
