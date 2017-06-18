//
//  FruitController.swift
//  youtubefinal
//
//  Created by Ramya Katipelly on 7/22/16.
//  Copyright © 2016 16545_RajashekarReddy Rela. All rights reserved.
//

import UIKit

class FruitController: UIViewController {

    @IBOutlet var bgImage: UIImageView!
    @IBOutlet var FruitNameLabel: UILabel!
    var count : Int = 1
    let myImages=["grapes.jpg","cherry.jpg","apple.jpg","banana.jpg","mango.jpeg","oranges.jpg","watermelon.jpg","pomo.jpeg","straw.jpg","guava.jpg","kiwi.jpeg","papaya.jpg","peach.jpeg","plum.jpeg"]
    
    let myImageNames=["Grapes","Cherry","Apple","Banana","Mango","Orange","Watermelon","Pomegranate","Strawberry","Guava","Kiwi","Papaya","Peach","Plum"]
    override func viewDidLoad() {
        super.viewDidLoad()
        let leftSwipe = UISwipeGestureRecognizer(target: self,action: Selector("HandleSwipe:"))
        let RigthSwipe = UISwipeGestureRecognizer(target: self,action: Selector("HandleSwipe:"))
        
        let image: UIImage = UIImage(named: myImages[0])!
        bgImage = UIImageView(image: image)
        bgImage!.frame = CGRectMake(-4,221,379,397)
        self.view.addSubview(bgImage!)
        
        leftSwipe.direction = .Left
        RigthSwipe.direction = .Right
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(RigthSwipe)
        
    }
    
    func HandleSwipe(sender : UISwipeGestureRecognizer){
        if(sender.direction == .Left){
            if(count == 1) {
                let image: UIImage = UIImage(named: myImages[count])!
                bgImage = UIImageView(image: image)
                bgImage!.frame = CGRectMake(-4,221,379,397)
                FruitNameLabel.text=myImageNames[count]
                self.view.addSubview(bgImage!)
                count=count+1
            }
            else if(count == myImages.count){
                let image: UIImage = UIImage(named: myImages[myImages.count-1])!
                bgImage = UIImageView(image: image)
                bgImage!.frame = CGRectMake(-8,220,387,398)
                FruitNameLabel.text=myImageNames[count-1]
                self.view.addSubview(bgImage!)
            }
            else{
                let image: UIImage = UIImage(named: myImages[count])!
                bgImage = UIImageView(image: image)
                bgImage!.frame = CGRectMake(-8,220,387,398)
                FruitNameLabel.text=myImageNames[count]
                self.view.addSubview(bgImage!)
                count=count+1
            }
        }
        if(sender.direction == .Right){
            if(count == myImages.count) {
                let image: UIImage = UIImage(named: myImages[count-1])!
                bgImage = UIImageView(image: image)
                bgImage!.frame = CGRectMake(-8,220,387,398)
                FruitNameLabel.text=myImageNames[count-1]
                self.view.addSubview(bgImage!)
                count=count-1
            }
            else if(count == 0){
                let image: UIImage = UIImage(named: myImages[0])!
                bgImage = UIImageView(image: image)
                bgImage!.frame = CGRectMake(-8,220,387,398)
                FruitNameLabel.text=myImageNames[0]
                self.view.addSubview(bgImage!)
            }
            else{
                let image: UIImage = UIImage(named: myImages[count])!
                bgImage = UIImageView(image: image)
                bgImage!.frame = CGRectMake(-8,220,387,398)
                FruitNameLabel.text=myImageNames[count]
                self.view.addSubview(bgImage!)
                count=count-1
            }
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
