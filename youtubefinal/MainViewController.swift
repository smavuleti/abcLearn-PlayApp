//
//  MainViewController.swift
//  Akhila-ios-Project-Puzzle
//
//  Created by Akhila  Pasula on 5/30/16.
//  Copyright © 2016 Akhila  Pasula. All rights reserved.
//

import UIKit

public var clearBtn = UIButton()
public var baseImg = UIImage(named: "image3.jpg")

protocol communicationControllerM {
    func backFromM()
}

class MainViewController: UIViewController, communicationControllerMenu {
    
    var delegate: communicationControllerM? = nil
    
    @IBOutlet weak var movesLbl: UILabel!
    @IBOutlet weak var tileView: UIView!
    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var previewBtn: UIButton!
    
    @IBOutlet weak var Btn: UIButton!
    var tileArray: [Tile] = []
    var numMoves = 0
    var level = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tileView.layer.borderWidth = 2
        menuBtn.addTarget(self, action: #selector(callMenuModal), forControlEvents: .TouchUpInside)
        previewBtn.addTarget(self, action: #selector(previewImg), forControlEvents: .TouchUpInside)
        Btn.addTarget(self, action: #selector(goBackToMainVC), forControlEvents: .TouchUpInside)

    }
    
    func goBackToMainVC() {
        
        self.delegate?.backFromM()
        }

    
    func callMenuModal() {
        let menuVC = MenuViewController()
        menuVC.delegate = self
        menuVC.modalPresentationStyle = .OverCurrentContext
        presentViewController(menuVC, animated: false, completion: nil)
    }
    
    func previewImg() {
        let imgView = UIImageView(frame: CGRectMake(0, 0, tileView.bounds.width, tileView.bounds.height))
        imgView.image = baseImg
        imgView.alpha = 0
        self.tileView.addSubview(imgView)
        self.tileView.sendSubviewToBack(imgView)
        
        self.tileView.clipsToBounds = true
        UIView.animateWithDuration(1, animations: {
            for btn in self.tileArray {
                btn.alpha = 0
            }
            imgView.alpha = 1

            }, completion: {finished in
                sleep(1)
                UIView.animateWithDuration(1, animations: {
                    for btn in self.tileArray {
                        if(btn != clearBtn) {
                            btn.alpha = 1
                        }
                        imgView.alpha = 0
                    }

                    }, completion: { finished in
                        imgView.removeFromSuperview()
                })
        })
        
    }

    func createTiles(level: Int, img: UIImage) {
        for  i in 0  ..< (level*level) {
            let distanceBetweenBtns = Double(tileView.frame.size.width)/Double(level)
            let btn = Tile()
            btn.setupBtn(distanceBetweenBtns, level: level, iValue: i)
            btn.addTarget(self, action: #selector(btnWasPressed), forControlEvents: .TouchUpInside)
            
            if(i == (level*level)-1) {
                btn.imgOrBlackBtn(false)
                clearBtn = btn
                clearBtn.alpha = 0
            } else {
                btn.imgOrBlackBtn(true)
            }
            
            btn.insertImg(img, view: tileView)
            tileView.addSubview(btn)
            tileArray.append(btn)
        }
        randomizeBtnLocation()
    }
    
    func btnWasPressed(sender: Tile) {
        if(sender.btnWasPressed()) {
            numMoves += 1
            movesLbl.text = "Moves: " + String(numMoves)
        }
        let arrayValueBtn = getArrayValue(sender)
        let arrayValueClear = getArrayValue(clearBtn)
        
        swap(&tileArray[arrayValueBtn], &tileArray[arrayValueClear])
        checkSolution()
    }
    
    func randomizeBtnLocation() {
        let rndmNumOfShuffles = Int(arc4random_uniform(40)+60)
        var arrayAroundClearBtn: [Tile] = []
        var lastRoundBtn = self.tileArray[0]
        for _ in 0...rndmNumOfShuffles {
            for btn in self.tileArray {
                if (btn.compareBtns(btn.frame.origin.x, senderY: btn.frame.origin.y)) {
                    arrayAroundClearBtn.append(btn)
                }
            }
            
            let rndmChosen = Int(arc4random_uniform(UInt32(arrayAroundClearBtn.count)))
            if (lastRoundBtn != arrayAroundClearBtn[rndmChosen]) {
                arrayAroundClearBtn[rndmChosen].moveBtn()
                
                let arrayValueBtn = getArrayValue(arrayAroundClearBtn[rndmChosen])
                let arrayValueClear = getArrayValue(clearBtn)
                
                swap(&tileArray[arrayValueBtn], &tileArray[arrayValueClear])
                
                lastRoundBtn = arrayAroundClearBtn[rndmChosen]
                arrayAroundClearBtn.removeAll()
            }
            arrayAroundClearBtn.removeAll()
        }
    }
    
    func checkSolution() {
       
        for i in 1...(self.tileArray.count-1) {
            if(Int(self.tileArray[i].titleLabel!.text!)! != Int(self.tileArray[i-1].titleLabel!.text!)!+1) {
                return
            }
        }
        
        let alert = UIAlertController(title: "YAY!", message: "YOU WON THE GAME...\nTry a harder level!", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OKAY", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
        print("winner!")
        wonGame()
        
        
    }
    
    func wonGame() {
        let imgView = UIImageView(frame: CGRectMake(0, 0, tileView.bounds.width, tileView.bounds.height))
        imgView.image = baseImg
        imgView.alpha = 0
        self.tileView.addSubview(imgView)
        self.tileView.sendSubviewToBack(imgView)
        
        self.tileView.clipsToBounds = true
        UIView.animateWithDuration(1, animations: {
            for btn in self.tileArray {
                btn.alpha = 0
            }
            imgView.alpha = 1
        })
    }
    
    
    
    func getArrayValue(item: UIButton) -> Int{
        for btn in 0..<tileArray.count {
            if item == tileArray[btn] {
                return btn
            }
        }
        return 0
    }
    
    func backFromMenu(lvl: Int, img: UIImage) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
        for view in tileView.subviews{
            if let str = view as? UIImageView {
                view.alpha = 0
                view.removeFromSuperview()
                str.image = baseImg
            }
        }
        
        numMoves = 0
        movesLbl.text = "Moves: " + String(numMoves)
        
        tileView.layer.borderColor = UIColor.blackColor().CGColor
        for btn in tileArray {
            btn.removeFromSuperview()
        }
        self.tileView.backgroundColor = .blackColor()
        tileArray.removeAll()
        createTiles(lvl, img: img)
        level = lvl
        baseImg = img
    }
}