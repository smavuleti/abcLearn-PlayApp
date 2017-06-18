//
//  ColorController.swift
//  youtubefinal
//
//  Created by Ramya Katipelly on 7/22/16.
//  Copyright © 2016 16545_RajashekarReddy Rela. All rights reserved.
//

import UIKit

class ColorController: UIViewController {
    var count : Int = 1
    @IBOutlet var BackButton: UIButton!
    @IBOutlet var NextButton: UIButton!
    @IBOutlet var bgImage: UIImageView!
    let myImages=["Brown1.png","Violet1.png","Yellow1.png","black1.png","Blue1.png","green1.png","Pink1.png","Red1.png","Orange1.png"]
    
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
                self.view.addSubview(bgImage!)
                count=count+1
            }
            else if(count == myImages.count){
                let image: UIImage = UIImage(named: myImages[myImages.count-1])!
                bgImage = UIImageView(image: image)
                bgImage!.frame = CGRectMake(-8,220,387,398)
                self.view.addSubview(bgImage!)
            }
            else{
                let image: UIImage = UIImage(named: myImages[count])!
                bgImage = UIImageView(image: image)
                bgImage!.frame = CGRectMake(-8,220,387,398)
                self.view.addSubview(bgImage!)
                count=count+1
            }
        }
        if(sender.direction == .Right){
            if(count == myImages.count) {
                let image: UIImage = UIImage(named: myImages[count-1])!
                bgImage = UIImageView(image: image)
                bgImage!.frame = CGRectMake(-8,220,387,398)
                self.view.addSubview(bgImage!)
                count=count-1
            }
            else if(count == 0){
                let image: UIImage = UIImage(named: myImages[0])!
                bgImage = UIImageView(image: image)
                bgImage!.frame = CGRectMake(-8,220,387,398)
                self.view.addSubview(bgImage!)
            }
            else{
                let image: UIImage = UIImage(named: myImages[count])!
                bgImage = UIImageView(image: image)
                bgImage!.frame = CGRectMake(-8,220,387,398)
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
