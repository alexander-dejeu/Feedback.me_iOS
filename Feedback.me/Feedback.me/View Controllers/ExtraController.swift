//
//  ExtraController.swift
//  Feedback.me
//
//  Created by Alexander Dejeu on 1/10/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import UIKit
import MessageUI

class ExtraController: UIViewController, MFMailComposeViewControllerDelegate {

    //MARK: - IBOutlets
    @IBOutlet weak var settingsTableView : UITableView!
    
    
    //MARK: - Properties
    var tableviewData : [[String]] = [["Feedback", "Share", "Rate Us"], ["Logout"]]
    
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Extras"
        self.view.backgroundColor = globalColors.background
        
        self.settingsTableView.backgroundColor = globalColors.background
        self.settingsTableView.sectionHeaderHeight = 24
        self.settingsTableView.tableFooterView = createMakeSchoolFooterView()
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

    func share(){
        let textToShare = "Feedback-Me is awesome!😍  I am to send and recieve quality feedback at work and school🎉  Check it out on the iOS app store!"
        
        if let myWebsite = URL(string: "itms-apps://itunes.apple.com/us/app/apple-store/id1196623665?mt=8") {
            let objectsToShare = [textToShare, myWebsite] as [Any]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            
            
            // activityVC.excludedActivityTypes = [UIActivityTypeAirDrop, UIActivityTypeAddToReadingList]
            //
            
            activityVC.popoverPresentationController?.sourceView = self as? UIView
            self.present(activityVC, animated: true, completion: nil)
        }
    }
    
    func rateUs(){
        let url=URL(string:"itms-apps://itunes.apple.com/us/app/apple-store/id1196623665?mt=8")
        UIApplication.shared.openURL(url!)
    }
    
    func logout(){
        self.performSegue(withIdentifier: "unwindToLogin", sender: nil)
    }
    
    // MARK Email feedback
    func feedback(){
        let mailComposeViewController = configuredMailComposeViewController()
        mailComposeViewController.navigationBar.tintColor = UIColor.white
        
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: {
                UIApplication.shared.setStatusBarStyle(UIStatusBarStyle.lightContent, animated: true)})
        }
        else {
            self.showSendMailErrorAlert()
        }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        mailComposerVC.setToRecipients(["hello@DoGoodTechnology.com"])
        mailComposerVC.setSubject("Feedback.me - Feedback")
        mailComposerVC.setMessageBody("What do think about Feedback.me? \u{1F60C}", isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    
    // MARK: MFMailComposeViewControllerDelegate
    func mailComposeController(_ controller: MFMailComposeViewController!, didFinishWith result: MFMailComposeResult, error: Error!) {
        controller.dismiss(animated: true, completion: nil)
    }
}


//MARK: - UITableview Delegate
extension ExtraController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                feedback()
            case 1:
                share()
            case 2:
                rateUs()
            default:
                print(#function, "issue hit default")
            }
        }
        else if indexPath.section == 1 {
            logout()
        }
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
}


//MARK: - UITableview DataSource
extension ExtraController : UITableViewDataSource {
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath) as! SettingsCell
        cell.settingLabel.text = tableviewData[indexPath.section][indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}
