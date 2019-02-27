//
//  LogInViewController.swift
//  Twitter
//
//  Created by Bryan Caldera on 2/26/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        if(UserDefaults.standard.bool(forKey: "userLoggedIn") == true) {
            self.performSegue(withIdentifier: "LogInToHome", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onLogIn(_ sender: Any) {
        
        let myUrl = "https://api.twitter.com/oauth/request_token"
        TwitterAPICaller.client?.login(url: myUrl, success: {
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            self.performSegue(withIdentifier: "LogInToHome", sender: self)
        }, failure: { (Error) in
            print("Unable to log in")
        })
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
