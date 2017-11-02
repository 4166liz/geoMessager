//
//  TablesViewController.swift
//  geoMessager
//
//  Created by sunny on 02/11/2017.
//  Copyright © 2017 sunny. All rights reserved.
//

import UIKit
import Firebase

class TablesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var txtFirstname: UITextField!
    
    @IBOutlet weak var txtLastname: UITextField!
    
    
    @IBAction func btnAdduser(_ sender: CustomButton) {
      var ref: DatabaseReference!
        
        ref = Database.database().reference()
        
        let userTable : [String : Any] =
            ["FirstName": txtFirstname.text!,
             "LastName": txtLastname.text!,
             "IsApproved": false]
        
        // add to the Firebase JSON node for MyUsers
        ref.child("MyUsers").childByAutoId().setValue(userTable)
        
        // show confirmation alert
        let ac = UIAlertController(title: "User Saved!", message:"The user information  was saved successfully!", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
        
        // reset controls
        txtLastname.text = nil
        txtFirstname.text = nil
    }
}


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

