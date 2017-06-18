//
//  Math1.swift
//  youtubefinal
//
//  Created by Shashank Eeda on 7/21/16.
//  Copyright © 2016 16545_RajashekarReddy Rela. All rights reserved.
//

import UIKit

class Math1: UIViewController {
    @IBOutlet var q1: UILabel!
    
    @IBOutlet var q2: UILabel!
    
    @IBOutlet weak var score: UILabel!
    var answer = 0;
    var scoring = 0;
    @IBOutlet var b1: UIButton!
    
    @IBOutlet var Algebra: UILabel!
    @IBOutlet var b2: UIButton!
    
    @IBOutlet var b3: UIButton!
    
    @IBOutlet var quesbut: UIButton!
    @IBOutlet var b4: UIButton!
    
    func quiz(){
        quesbut.enabled=false
        let r1 = Int(arc4random_uniform(100))
        let r2 = Int(arc4random_uniform(100))
        
        q1.text = String(r1)
        q2.text = String(r2)
        
        var r3: Int = Int(arc4random_uniform(200))
        var r4: Int = Int(arc4random_uniform(200))
        var r5: Int = Int(arc4random_uniform(200))
        
        var random = Int(arc4random_uniform(4))
        if random == 0{
            Algebra.text="+"
            answer = r1 + r2
            repeat{
                r3 = Int(arc4random_uniform(200))
                r4 = Int(arc4random_uniform(200))
                r5 = Int(arc4random_uniform(200))
            }while r3==answer || r4==answer || r5==answer
        }
        else if random == 1{
            Algebra.text="-"
            answer = r1 - r2
            repeat{
                r3 = Int(arc4random_uniform(200))-50
                r4 = Int(arc4random_uniform(200))-25
                r5 = r1+r2
            }while r3==answer || r4==answer || r5==answer
        }
        else if random == 2{
            Algebra.text="*"
            answer = r1 * r2
            repeat{
                r3 = Int(arc4random_uniform(2000))
                r4 = Int(arc4random_uniform(2000))
                r5 = Int(arc4random_uniform(2000))
            }while r3==answer || r4==answer || r5==answer
        }
        else if random == 3{
            Algebra.text="%"
            if(r1>r2){
                answer = r1 % r2
            }
            else{
                q1.text = String(r2)
                q2.text = String(r1)
                answer = r2 % r1
            }
            repeat{
                r3 = Int(arc4random_uniform(50))
                r4 = Int(arc4random_uniform(50))
                r5 = Int(arc4random_uniform(50))
            }while r3==answer || r4==answer || r5==answer
        }
        
        random = Int(arc4random_uniform(4))
        if random == 0{
            b1.setTitle(String(answer), forState: .Normal)
            b2.setTitle(String(r3), forState: .Normal)
            b3.setTitle(String(r4), forState: .Normal)
            b4.setTitle(String(r5), forState: .Normal)
        }
        else if random == 1{
            b1.setTitle(String(r3), forState: .Normal)
            b2.setTitle(String(answer), forState: .Normal)
            b3.setTitle(String(r4), forState: .Normal)
            b4.setTitle(String(r5), forState: .Normal)
            
        }
        else if random == 2{
            b1.setTitle(String(r4), forState: .Normal)
            b2.setTitle(String(r3), forState: .Normal)
            b3.setTitle(String(answer), forState: .Normal)
            b4.setTitle(String(r5), forState: .Normal)
            
        }
        else if random == 3{
            b1.setTitle(String(r5), forState: .Normal)
            b2.setTitle(String(r3), forState: .Normal)
            b3.setTitle(String(r4), forState: .Normal)
            b4.setTitle(String(answer), forState: .Normal)
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        quiz()
    }
    func enablebut(){
        b1.enabled=false
        b2.enabled=false
        b3.enabled=false
        b4.enabled=false
        quesbut.enabled=true
    }
    
    @IBAction func but1(sender: AnyObject) {
        NSLog("Click")
        if b1.titleLabel!.text == String(answer){
            scoring=scoring+1
            score.text = "Correct  Score is  \(scoring)"
            
        }
        else
        {
            scoring=scoring-1
            score.text = "Wrong Score is  \(scoring)"
        }
        quesbut.enabled=true
        enablebut()
        
    }
    @IBAction func but2(sender: AnyObject) {
        if b2.titleLabel!.text == String(answer){
            scoring=scoring+1
            score.text = "Correct  Score is  \(scoring)"
        }
        else
        {
            score.text = "Wrong Score is  \(scoring)"
            scoring=scoring-1
        }
        enablebut()
        
    }
    @IBAction func but3(sender: AnyObject) {
        if b3.titleLabel!.text == String(answer){
            scoring=scoring+1
            score.text = "Correct  Score is  \(scoring)"
        }
        else
        {
            scoring=scoring-1
            score.text = "Wrong Score is  \(scoring)"
        }
        enablebut()
        
    }
    @IBAction func but4(sender: AnyObject) {
        if b4.titleLabel!.text == String(answer){
            scoring=scoring+1
            score.text = "Correct  Score is  \(scoring)"
        }
        else
        {
            scoring=scoring-1
            score.text = "Wrong Score is  \(scoring)"
        }
        enablebut()
    }
    
    @IBAction func Nextquestion(sender: AnyObject) {
        b1.enabled=true
        b2.enabled=true
        b3.enabled=true
        b4.enabled=true
        quiz()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

