//
//  StoryDisplay.swift
//  Story
//
//  Created by Sruthi Mavuleti on 7/25/16.
//  Copyright © 2016 Sruthi Mavuleti. All rights reserved.
//

import UIKit

var story_id = ""

class StoryDisplay: UIViewController {

    
    @IBOutlet var displayWebView: UIWebView!
    
        //var stories = ["We-Go-To-Bo","Danny-the-Dragon (1)","Fairy-Circles--Truly-a-Fairy-Tale"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Story selected >> \(story_id)")


        // Do any additional setup after loading the view.
        
        let path = NSBundle.mainBundle().pathForResource(story_id, ofType: "pdf")
        
        let url = NSURL(string: path!)
        let urlRequest = NSURLRequest(URL: url!)
       displayWebView.loadRequest(urlRequest)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
