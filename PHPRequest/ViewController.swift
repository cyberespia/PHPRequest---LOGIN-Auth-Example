//
//  ViewController.swift
//  PHPRequest
//
//  Created by Charles Konkol on 11/5/18.
//  Copyright © 2018 Charles Konkol. All rights reserved.
//
import Foundation
import UIKit

class ViewController: UIViewController {
    
    //declare codable instance
    var users = [User]()
    
    //declare username
    var gusername: String! = ""
    
    //var names: String?
    
    @IBOutlet weak var txtUserName: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var txtResults: UILabel!
    
    @IBOutlet weak var results: UILabel!
    
    //Declare all codable fields in JSON in correct order
    //See example: https://web234-professorgeek.c9users.io/login/json.php?username=user&pwd=user
    //names need to match JSON fields
    struct User: Codable  {
        let Members_id: String
       let Members_UserName: String
        let Members_FName: String
        let Members_LName: String
        let Members_Email: String
        let Members_Phone: String
        let Members_Password: String
        
        //names need to match Codable fields
        private enum CodingKeys: String, CodingKey {
            case Members_id
            case Members_UserName
            case Members_FName
            case Members_LName
            case Members_Email
            case Members_Phone
            case Members_Password
        }
    }
    
    
    
    
    @IBAction func btnLogin(_ sender: UIButton) {
        //call JSON login check
        if (txtUserName.text != "" && txtPassword.text != ""){
            checklogin(username:(txtUserName.text)!,password:(txtPassword.text)!)
        }else{
            txtResults.text = "Username and Password Required"
            txtUserName.becomeFirstResponder()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.txtUserName.becomeFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func login(){
        DispatchQueue.main.async {
            if self.gusername  == (self.txtUserName.text)!{
                self.txtResults.text = "Success"
            }else{
                self.txtResults.text = "Fail"
            }
        }
    }
    
    func checklogin(username:String,password:String)
    {
        let urlString = "https://www.ckonkol.com/testapps/json.php?username=\(username)&pwd=\(password)"
        guard let gitUrl = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: gitUrl) { (data, response
            , error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                self.users = try decoder.decode(Array<User>.self, from: data)
                    self.gusername = self.users.first!.Members_UserName
                    print("success")
                    print(self.gusername!)
                    print(self.users.first!.Members_Password)
            } catch let err {
                print("Err", err)
            }
            //call login success or failure
            self.login()
            }
            task.resume()
        
    }

}

