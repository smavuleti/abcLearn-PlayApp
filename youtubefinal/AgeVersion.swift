//
//  AgeVersion.swift
//  Feed
//
//  Created by Sruthi Mavuleti on 7/29/16.
//  Copyright © 2016 Sruthi Mavuleti. All rights reserved.
//

import UIKit
var ageGroup = ""
class AgeVersion: UIViewController {

    @IBAction func toddlersButton(sender: AnyObject) {
        print("3 - 5 years is clicked....")
        ageGroup = "toddlers"
        
    }
    
    
    @IBAction func kidsButton(sender: AnyObject) {
         print("5 - 7 years is clicked....")
        ageGroup = "kids"
    }
    
    @IBAction func teensButton(sender: AnyObject) {
        print("7-10 years is clicked...")
        ageGroup = "teens"
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
