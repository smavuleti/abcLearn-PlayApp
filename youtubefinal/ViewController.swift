//
//  ViewController.swift
//  youtubefinal
//
//  Created by RajashekarReddy Rela on 7/20/16.
//  Copyright © 2016 16545_RajashekarReddy Rela. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate, communicationControllerM {
    

    @IBOutlet weak var Btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Btn.addTarget(self, action: #selector(callMenuModal), forControlEvents: .TouchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func callMenuModal() {
        let mainVC = MainViewController()
        mainVC.delegate = self
        mainVC.modalPresentationStyle = .OverCurrentContext
        presentViewController(mainVC, animated: false, completion: nil)
    }
    func backFromM() {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }

    @IBAction func popover(sender: AnyObject)
    {
        self.performSegueWithIdentifier("MathPopOver", sender: self)
    }
   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "MathPopOver"
        {
            var vc = segue.destinationViewController as! UIViewController
            
            var controller = vc.popoverPresentationController
            
            if controller != nil
            {
                controller?.delegate = self
            }
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle
    {
        return .None
    }

}

