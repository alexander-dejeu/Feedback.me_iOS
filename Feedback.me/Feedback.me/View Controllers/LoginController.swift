//
//  LoginController.swift
//  Feedback.me
//
//  Created by Alexander Dejeu on 1/18/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField : UITextField!
    @IBOutlet weak var loginButton : UIButton!
    
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 10
        
    }
    
    
    //MARK: - Helpers
    @IBAction func loginButtonTapped(_ sender: Any) {
        var validResponse = ""
        let email = emailTextField.text
        let password = passwordTextField.text
        
        var request = URLRequest(url: URL(string: "https://feedback-us.herokuapp.com/auth_user")!)
        request.httpMethod = "POST"
        let postString = "email=\(email!)&password=\(password!)"
        
        print("POST STRING: \(postString)")
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(error)")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
                return
                
            }
            
            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(responseString!)")
            DispatchQueue.main.async {
                let testRole : role = .student
                globalColors.setGlobalColorsBasedOnRole(role : testRole)
                self.performSegue(withIdentifier: "segueFromLoginToHome", sender:self)
            }
            //            if "auth_token" in responseString! {
            //                print("VALID AUTH")
            //            }
            validResponse = responseString!
            
        }
        task.resume()
        
        if validResponse != ""{
            print("valid")
            self.performSegue(withIdentifier: "segueFromLoginToHome", sender: nil)
        }
    }

    
    // MARK: - Navigation
    @IBAction func unwindToLogin(segue : UIStoryboardSegue){
    
    }
    
    func segueToApp(){
         self.performSegue(withIdentifier: "segueFromLoginToHome", sender: nil)
    }
}
