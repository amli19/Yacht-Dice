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
        initStart()
    }

    var diceRoll:[Dice]=[]
    var count = 3
    let D1Item = Dice(value: 1, selected: false)
    let D2Item = Dice(value: 1, selected: false)
    let D3Item = Dice(value: 1, selected: false)
    let D4Item = Dice(value: 1, selected: false)
    let D5Item = Dice(value: 1, selected: false)
    

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
                if(currentIndex==0){
                    D1.setImage(UIImage(named: "Dice\(DRoll)"), for: .normal)
                }
                if(currentIndex==1){
                    D2.setImage(UIImage(named: "Dice\(DRoll)"), for: .normal)
                }
                if(currentIndex==2){
                    D3.setImage(UIImage(named: "Dice\(DRoll)"), for: .normal)
                }
                if(currentIndex==3){
                    D4.setImage(UIImage(named: "Dice\(DRoll)"), for: .normal)
                }
                if(currentIndex==4){
                    D5.setImage(UIImage(named: "Dice\(DRoll)"), for: .normal)
                }
            }
            currentIndex+=1
        }
        if(count>0){
            count-=1
        }
        self.NumberOfRolls.text="Rolls: "+String(count)
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
    
    func initStart()  {
        diceRoll.append(D1Item)
        diceRoll.append(D2Item)
        diceRoll.append(D3Item)
        diceRoll.append(D4Item)
        diceRoll.append(D5Item)
        self.NumberOfRolls.text="Rolls: "+String(count)
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







