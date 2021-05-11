//
//  ViewController.swift
//  Yahtzee
//
//  Created by JPL-ST-SPRING2021 on 5/10/21.
//

import UIKit

class YahtzeeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    var diceRoll:[Dice]=[]
    var count = 3
    let D1Item = Dice(value: 1, selected: false)
    let D2Item = Dice(value: 1, selected: false)
    let D3Item = Dice(value: 1, selected: false)
    let D4Item = Dice(value: 1, selected: false)
    let D5Item = Dice(value: 1, selected: false)

    
//    @IBOutlet weak var dicebutton: UIButton!
//    @IBAction func D1test(_ sender: Any) {
//        //let D1Roll = arc4random_uniform(6) + 1
//        canBeRolled.toggle()
//        dicebutton.setImage(UIImage(named: "Dice1"), for: .normal)
//
//    }
    @IBOutlet weak var NumberOfRolls: UILabel!
    
    @IBOutlet weak var D1: UIButton!
    
    @IBOutlet weak var D2: UIButton!
    @IBOutlet weak var D3: UIButton!
    
    @IBOutlet weak var D4: UIButton!
    
    @IBOutlet weak var D5: UIButton!
    
    @IBAction func Roll(_ sender: Any) {
        //rolls random number from 1-6 for all dices not selected
        var currentIndex=0
        for _ in diceRoll {
            if(diceRoll[currentIndex].selected==false && count > 0){
                let DRoll = arc4random_uniform(6) + 1
                diceRoll[currentIndex].value=Int(DRoll)
                D1.setImage(UIImage(named: "Dice\(DRoll)"), for: .normal)
            }
            currentIndex+=1
        }
        if(count>0){
            count-=1
        }
        self.NumberOfRolls.text="Rolls: "+String(count)
        
//        let D1Roll = arc4random_uniform(6) + 1
//        let D2Roll = arc4random_uniform(6) + 1
//        let D3Roll = arc4random_uniform(6) + 1
//        let D4Roll = arc4random_uniform(6) + 1
//        let D5Roll = arc4random_uniform(6) + 1
//        let D6Roll = arc4random_uniform(6) + 1
            
        //displays rolls
//        D1.setImage(UIImage(named: "Dice\(D6Roll)"), for: .normal)
//        D2.setImage(UIImage(named: "Dice\(D6Roll)"), for: .normal)
//        D3.setImage(UIImage(named: "Dice\(D6Roll)"), for: .normal)
//        D4.setImage(UIImage(named: "Dice\(D6Roll)"), for: .normal)
//        D5.setImage(UIImage(named: "Dice\(D6Roll)"), for: .normal)
        
    }
    
    @IBAction func D1Tap(_ sender: Any) {
        diceRoll[0].selected.toggle()
    }
    
    @IBAction func D2Tap(_ sender: Any) {
        diceRoll[1].selected.toggle()
    }
    
    
    @IBAction func D3Tap(_ sender: Any) {
        diceRoll[2].selected.toggle()
    }
    
    @IBAction func D4Tap(_ sender: Any) {
        diceRoll[3].selected.toggle()
    }
    
    @IBAction func D5Tap(_ sender: Any) {
        diceRoll[4].selected.toggle()
    }
    
    
    //
//    func DiceArray{
//    }
//    func endOfTurn{
//      reset #rolls to 3
//      switch current player to false and next one to true
//    }

    struct Dice {
        var value:Int
        var selected:Bool
        
    }
    
}







