//
//  ViewController.swift
//  Story
//
//  Created by Sruthi Mavuleti on 7/25/16.
//  Copyright © 2016 Sruthi Mavuleti. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var myTableView: UITableView!
    
    @IBAction func backButton(sender: AnyObject) {
        
        
    }
    var identities = ["A"]
    //var pdfArray = ["AliceinWonderland","TheJungleBook","PeterPan","DannytheDragon","SantaintheSummer","PrincessRoseandtheGoldenBird","The12DaysofChristmas","TheMoonandtheCap"]
    var pdfs: [String: [String]] = ["toddlers": ["Writing-on-Walls","That's-Funny","My-Precious-Baby-Dear","Gecko-on-the-Wall","Grandpa's-Gold","Hide-and-Seek","The-Adventures-of-Supercow","All-About-Apples","World-Famous-Nursery-Rhymes","Fat-King-Thin-Dog"],
                                    "kids": ["AliceinWonderland","TheJungleBook","PeterPan","DannytheDragon","SantaintheSummer","PrincessRoseandtheGoldenBird","The12DaysofChristmas","TheMoonandtheCap"],
                                    "teens": ["1-the_gift_of_the_magi_0","andersen_little_match_girl","jackson_lottery","MisforMagicUK","ASoundofThunder","LittleWizardStoriesofOz","grimms_fairytales"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(ageGroup)
       // identities = ["A"]
        myTableView.dataSource = self;
        myTableView.delegate = self;
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: UITableView Datasource Methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return pdfArray.count
        return pdfs[ageGroup]!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("feedCell", forIndexPath: indexPath) as! FeedCell
        
        cell.myTitleView?.text = titleForIndexPath(indexPath)
        cell.myImageView?.image = imageForIndexPath(indexPath)
        
        return cell
    }
    
    //MARK: UITableView Delegate Methods
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //TODO: Implement what happens on a row selected!
        
        print("Row selected >> \(indexPath.row)")
        
        //let vcName = identities[indexPath.row]
        
        //let viewController = storyboard?.instantiateViewControllerWithIdentifier(vcName)
        
        let viewController = StoryDisplay()
      //  story_id = "test"
        story_id =  pdfs[ageGroup]![indexPath.row]
        //performSegueWithIdentifier("pdf", sender: nil)
        print(story_id)
        //self.navigationController?.pushViewController(viewController!, animated: true)
        self.navigationController?.presentViewController(viewController, animated: true, completion: nil)

        view.backgroundColor = UIColor.redColor()

    
    }
    
    //MARK: Helper Methods
    //["Alice in Wonderland","The Jungle Book","Peter Pan","Danny the Dragon","Santa in the Summer","Princess Rose and the Golden Bird","The 12 Days of Christmas","The Moon and the Cap"]
    
    func titleForIndexPath(indexPath: NSIndexPath) -> String {
        print(indexPath)
        if(ageGroup == "toddlers"){
            //["Writing-on-Walls","That's-Funny","My-Precious-Baby-Dear","Gecko-on-the-Wall","Grandpa's-Gold","Hide-and-Seek","The-Adventures-of-Supercow","All-About-Apples","World-Famous-Nursery-Rhymes","Fat-King-Thin-Dog"],
            if indexPath.row == 0 {
                return "Writing on Walls"
            }
            else if indexPath.row == 1 {
                return "That's Funny"
            }
            else if indexPath.row == 2 {
                return "My Precious Baby Dear"
            }
            else if indexPath.row == 3 {
                return "Gecko on the Wall"
            }
            else if indexPath.row == 4 {
                return "Grandpa's Gold"
            }
            else if indexPath.row == 5 {
                return "Hide and Seek"
            }
            else if indexPath.row == 6 {
                return "The Adventures of Supercow"
            }
            else if indexPath.row == 7 {
                return "All About Apples"
            } else if indexPath.row == 8 {
                return "World Famous Nursery Rhymes"
            }
            else if indexPath.row == 9 {
                return "Fat King Thin Dog"
            }
            else {
                return "Default title!"
            }
        }
        else if(ageGroup == "kids"){
            //["AliceinWonderland","TheJungleBook","PeterPan","DannytheDragon","SantaintheSummer","PrincessRoseandtheGoldenBird","The12DaysofChristmas","TheMoonandtheCap"]
        if indexPath.row == 0 {
            return "Alice in Wonderland"
        }
        else if indexPath.row == 1 {
            return "The Jungle Book"
        }
        else if indexPath.row == 2 {
            return "Peter Pan"
        }
        else if indexPath.row == 3 {
            return "Danny the Dragon"
        }
        else if indexPath.row == 4 {
            return "Santa in the Summer"
        }
        else if indexPath.row == 5 {
            return "Princess Rose and the Golden Bird"
        }
        else if indexPath.row == 6 {
            return "The 12 Days of Christmas"
        }
        else if indexPath.row == 7 {
            return "The Moon and the Cap"
        }
        else {
            return "Default title!"
            }
        }
            
        else if(ageGroup == "teens"){
            ////"1-the_gift_of_the_magi_0","andersen_little_match_girl","jackson_lottery","MisforMagicUK","ASoundofThunder","LittleWizardStoriesofOz","grimms_fairytales"
            if indexPath.row == 0 {
                return "The Gift Of Magi"
            }
            else if indexPath.row == 1 {
                return "Little Match Girl"
            }
            else if indexPath.row == 2 {
                return "Lottery"
            }
            else if indexPath.row == 3 {
                return "M Is For Magic"
            }
            else if indexPath.row == 4 {
                return "A Sound Of Thunder"
            }
            else if indexPath.row == 5 {
                return "Little Wizard Stories Of Oz"
            }
            else if indexPath.row == 6 {
                return "Grimms - Fairytales"
            }
            else {
                return "Default title!"
            }
        }

   
        else {
            return "Default title!"
        }
        
    }

    
    func imageForIndexPath(indexPath: NSIndexPath) -> UIImage {
        print(indexPath.row)
        if(ageGroup == "toddlers"){
            //["Writing-on-Walls","That's-Funny","My-Precious-Baby-Dear","Gecko-on-the-Wall","Grandpa's-Gold","Hide-and-Seek","The-Adventures-of-Supercow","All-About-Apples","World-Famous-Nursery-Rhymes","Fat-King-Thin-Dog"],
            if indexPath.row == 0 {
                return UIImage(named: "WritingonWalls.png")!
            }
            else if indexPath.row == 1 {
                return UIImage(named: "That'sFunny.png")!
            }
            else if indexPath.row == 2 {
                return UIImage(named: "MyPreciousBabyDear.png")!
            }
                
            else if indexPath.row == 3 {
                return UIImage(named: "GeckoontheWall.png")!
            }
            else if indexPath.row == 4 {
                return UIImage(named: "Grandpa'sGold.png")!
            }
            else if indexPath.row == 5 {
                return UIImage(named: "HideandSeek.png")!
            }
            else if indexPath.row == 6 {
                return UIImage(named: "AdventuresofSupercow.png")!
            }
            else if indexPath.row == 7 {
                return UIImage(named: "AllAboutApples.png")!
            }
            else if indexPath.row == 8 {
                return UIImage(named: "WorldFamousNurseryRhymes.png")!
            }
            else if indexPath.row == 9 {
                return UIImage(named: "FatKingThinDog.png")!
            }
            else {
                return UIImage(named: "default.jpg")!
            }
        }
        
        else if(ageGroup == "kids"){
            if indexPath.row == 0 {
                return UIImage(named: "11Alice in Wonderland.jpg")!
            }
            else if indexPath.row == 1 {
                return UIImage(named: "12The Jungle Book.jpg")!
            }
            else if indexPath.row == 2 {
                return UIImage(named: "13Peter Pan.jpg")!
            }
                
            else if indexPath.row == 3 {
                return UIImage(named: "4Danny the Dragon.jpg")!
            }
            else if indexPath.row == 4 {
                return UIImage(named: "5Santa in the Summer.jpg")!
            }
            else if indexPath.row == 5 {
                return UIImage(named: "6Princess Rose and the Golden Bird.jpg")!
            }
            else if indexPath.row == 6 {
                return UIImage(named: "7The 12 Days of Christmas.jpg")!
            }
            else if indexPath.row == 7 {
                return UIImage(named: "8The Moon and the Cap.jpg")!
            }
            else {
                return UIImage(named: "default.jpg")!
            }
        }
            
            
        else if(ageGroup == "teens"){
            //the_gift_of_the_magi_0","andersen_little_match_girl","jackson_lottery","MisforMagicUK","ASoundofThunder","LittleWizardStoriesofOz","grimms_fairytales"
            if indexPath.row == 0 {
                return UIImage(named: "thegiftofmagi.jpeg")!
            }
            else if indexPath.row == 1 {
                return UIImage(named: "thelittlematchgirl.jpg")!
            }
            else if indexPath.row == 2 {
                return UIImage(named: "lottery.jpg")!
            }
                
            else if indexPath.row == 3 {
                return UIImage(named: "magic.jpg")!
            }
            else if indexPath.row == 4 {
                return UIImage(named: "ASoundofThunder.jpeg")!
            }
            else if indexPath.row == 5 {
                return UIImage(named: "Oz.gif")!
            }
            else if indexPath.row == 6 {
                return UIImage(named: "grimms_fairytales.jpeg")!
            }
                else {
                return UIImage(named: "default.jpg")!
            }
        }
            
        
        else {
            return UIImage(named: "default.jpg")!
        }
            }
    
   
}

