//
//  ViewController.swift
//  Yahtzee
//
//  Created by JPL-ST-SPRING2021 on 5/10/21.
//

import UIKit
//@import Calculator.swift

class YachtDiceViewController: UIViewController {
    
    //var calculate:CalculationsDelegate?
    
    var diceRoll:[Dice]=[]
    var count:Int = 3
    var countdown = 24
    var Player = 1
    var D1Item = Dice(value: 1, selected: false)
    var D2Item = Dice(value: 1, selected: false)
    var D3Item = Dice(value: 1, selected: false)
    var D4Item = Dice(value: 1, selected: false)
    var D5Item = Dice(value: 1, selected: false)
    var calc = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initStart()
    }

    
    
    @IBOutlet weak var NumberOfRolls: UILabel!
    
    //dice images
    @IBOutlet weak var D1: UIButton!
    @IBOutlet weak var D2: UIButton!
    @IBOutlet weak var D3: UIButton!
    @IBOutlet weak var D4: UIButton!
    @IBOutlet weak var D5: UIButton!
    
    @IBOutlet weak var Bonus: UILabel!
    @IBOutlet weak var Total: UILabel!
    @IBOutlet weak var currentPlayer: UILabel!
    
    //1st column Player 1
    @IBOutlet weak var P1Ones: UILabel!
    @IBOutlet weak var P1Twos: UILabel!
    @IBOutlet weak var P1Threes: UILabel!
    @IBOutlet weak var P1Fours: UILabel!
    @IBOutlet weak var P1Fives: UILabel!
    @IBOutlet weak var P1Sixes: UILabel!
    
    //1st column Player 2
    @IBOutlet weak var P2Ones: UILabel!
    @IBOutlet weak var P2Twos: UILabel!
    @IBOutlet weak var P2Threes: UILabel!
    @IBOutlet weak var P2Fours: UILabel!
    @IBOutlet weak var P2Fives: UILabel!
    @IBOutlet weak var P2Sixes: UILabel!
    
    //2nd column Player 1
    @IBOutlet weak var P1Free: UILabel!
    @IBOutlet weak var P1FourOfKind: UILabel!
    @IBOutlet weak var P1FullHouse: UILabel!
    @IBOutlet weak var P1SmStright: UILabel!
    @IBOutlet weak var P1Lstright: UILabel!
    @IBOutlet weak var P1Yahtzee: UILabel!
    //2nd column Player 2
    @IBOutlet weak var P2Free: UILabel!
    @IBOutlet weak var P2FourOfKind: UILabel!
    @IBOutlet weak var P2FullHouse: UILabel!
    @IBOutlet weak var P2SmStright: UILabel!
    @IBOutlet weak var P2Lstright: UILabel!
    @IBOutlet weak var P2Yahtzee: UILabel!
    
    
    @IBOutlet weak var RollView: UIButton!
    
    
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
    
    //Left side buttons
    @IBAction func Ones(_ sender: Any) {
        if(count<=2){
            if(Player == 1){
                if let text1 = P1Ones.text, text1.isEmpty {
                    let current = calc.Ones(arr: diceRoll)
                    self.P1Ones.text = String(current)
                    nextPlayer()
                }
            
            }
            else {
                if let text2 = P2Ones.text, text2.isEmpty {
                    let current = calc.Ones(arr: diceRoll)
                    self.P2Ones.text = String(current)
                    nextPlayer()
                }
            }
            countdown -= 1
        }
    }
    @IBAction func Twos(_ sender: Any) {
        if(count<=2){
            if(Player == 1){
                if let text1 = P1Twos.text, text1.isEmpty {
                    let current = calc.Twos(arr: diceRoll)
                    self.P1Twos.text = String(current)
                    nextPlayer()
                }
            
            }
            else {
                if let text2 = P2Twos.text, text2.isEmpty {
                    let current = calc.Twos(arr: diceRoll)
                    self.P2Twos.text = String(current)
                    nextPlayer()
                }
            }
            countdown -= 1
        }
    }
    @IBAction func Threes(_ sender: Any) {
        if(count<=2){
            if(Player == 1){
                if let text1 = P1Threes.text, text1.isEmpty {
                    let current = calc.Threes(arr: diceRoll)
                    self.P1Threes.text = String(current)
                    nextPlayer()
                }
            
            }
            else {
                if let text2 = P2Threes.text, text2.isEmpty {
                    let current = calc.Threes(arr: diceRoll)
                    self.P2Threes.text = String(current)
                    nextPlayer()
                }
            }
            countdown -= 1
        }
        
    }
    @IBAction func Fours(_ sender: Any) {
        if(count<=2){
            if(Player == 1){
                if let text1 = P1Fours.text, text1.isEmpty {
                    let current = calc.Fours(arr: diceRoll)
                    self.P1Fours.text = String(current)
                    nextPlayer()
                }
            
            }
            else {
                if let text2 = P2Fours.text, text2.isEmpty {
                    let current = calc.Fours(arr: diceRoll)
                    self.P2Fours.text = String(current)
                    nextPlayer()
                }
            }
            countdown -= 1
        }
    }
    @IBAction func Fives(_ sender: Any) {
        if(count<=2){
            if(Player == 1){
                if let text1 = P1Fives.text, text1.isEmpty {
                    let current = calc.Fives(arr: diceRoll)
                    self.P1Fives.text = String(current)
                    nextPlayer()
                }
            
            }
            else {
                if let text2 = P2Fives.text, text2.isEmpty {
                    let current = calc.Fives(arr: diceRoll)
                    self.P2Fives.text = String(current)
                    nextPlayer()
                }
            }
            countdown -= 1
        }
    }
    @IBAction func Sixes(_ sender: Any) {
        if(count<=2){
            if(Player == 1){
                if let text1 = P1Sixes.text, text1.isEmpty {
                    let current = calc.Sixes(arr: diceRoll)
                    self.P1Sixes.text = String(current)
                    nextPlayer()
                }
            
            }
            else {
                if let text2 = P2Sixes.text, text2.isEmpty {
                    let current = calc.Sixes(arr: diceRoll)
                    self.P2Sixes.text = String(current)
                    nextPlayer()
                }
            }
            countdown -= 1
        }
    }
    
    //Right side buttons
    @IBAction func Free(_ sender: Any) {
        if(count<=2){
            if(Player == 1){
                if let text1 = P1Free.text, text1.isEmpty {
                    let current = calc.freeHand(arr: diceRoll)
                    self.P1Free.text = String(current)
                    nextPlayer()
                }
            }
            else {
                if let text2 = P2Free.text, text2.isEmpty {
                    let current = calc.freeHand(arr: diceRoll)
                    self.P2Free.text = String(current)
                    nextPlayer()
                }
            }
            countdown -= 1
        }
    }
    
    @IBAction func FourOfKind(_ sender: Any) {
        nextPlayer()
    }
    @IBAction func Fullhouse(_ sender: Any) {
        nextPlayer()
    }
    @IBAction func SStraight(_ sender: Any) {
        nextPlayer()
    }
    @IBAction func LStraight(_ sender: Any) {
        nextPlayer()
    }
    @IBAction func Yahtzee(_ sender: Any) {
        //number of rolls must be 2 or lower
        //register score when tapped
    }

    
    func initStart()  {
        diceRoll.append(D1Item)
        diceRoll.append(D2Item)
        diceRoll.append(D3Item)
        diceRoll.append(D4Item)
        diceRoll.append(D5Item)
        self.currentPlayer.text = "Player 1 Turn"
        self.NumberOfRolls.text="Rolls: "+String(count)
    }
    
//move to next player
    func nextPlayer(){
        count = 3
        if(Player == 1){
            self.currentPlayer.text = "Player 2 Turn"
            self.NumberOfRolls.text="Rolls: "+String(count)
            Player = 2
            nextTurnReset()
        }
        else if(Player == 2){
            self.currentPlayer.text = "Player 1 Turn"
            self.NumberOfRolls.text="Rolls: "+String(count)
            Player = 1
            nextTurnReset()
        }
        
    }
//reset when player ends turn. used in nextPlayer
    func nextTurnReset() {
//        D1Item.selected=false
//        D2Item.selected=false
//        D3Item.selected=false
//        D4Item.selected=false
//        D5Item.selected=false
        diceRoll[0].selected=false
        diceRoll[1].selected=false
        diceRoll[2].selected=false
        diceRoll[3].selected=false
        diceRoll[4].selected=false
//        D1Item.value=1
//        D2Item.value=1
//        D3Item.value=1
//        D4Item.value=1
//        D5Item.value=1
        diceRoll[0].value=1
        diceRoll[1].value=1
        diceRoll[2].value=1
        diceRoll[3].value=1
        diceRoll[4].value=1
        
        D1.setImage(UIImage(named: "Dice1"), for: .normal)
        D2.setImage(UIImage(named: "Dice1"), for: .normal)
        D3.setImage(UIImage(named: "Dice1"), for: .normal)
        D4.setImage(UIImage(named: "Dice1"), for: .normal)
        D5.setImage(UIImage(named: "Dice1"), for: .normal)
    }
    
    func isEnd(){
        if(countdown==0){
            //end the game and show winner
        }
        if(countdown >= 1){
            countdown-=1
        }
    }
    
    struct Dice {
        var value:Int
        var selected:Bool
    }
    


    
}







