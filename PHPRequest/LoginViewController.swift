//
//  LoginViewController.swift
//  PHPRequest
//
//  Created by Charles Konkol on 11/19/18.
//  Copyright © 2018 Charles Konkol. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var lblName: UILabel!
    
    var strUsername: String!

    @IBAction func btnBack(_ sender: UIBarButtonItem) {
        self.dismiss(animated: false, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        lblName.text = "Welcome, \(strUsername!)!"
        // Do any additional setup after loading the view.
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
