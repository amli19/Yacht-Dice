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
    var P1Bonus:[Int]=[]//Stores values from singles
    var P2Bonus:[Int]=[]
    var P1TotalArr:[Int]=[]//array of all scores for P1
    var P2TotalArr:[Int]=[]//array of all scores for P2
    var num:Int = 1//used when dice is being toggled
    var count:Int = 3//number of rolls
    var countdown = 24//used in gameEnd
    var Player = 1//P1 or P2
    var D1Item = Dice(value: 1, selected: false)
    var D2Item = Dice(value: 1, selected: false)
    var D3Item = Dice(value: 1, selected: false)
    var D4Item = Dice(value: 1, selected: false)
    var D5Item = Dice(value: 1, selected: false)
    var calc = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initStart()
    }
    struct Dice {
        var value:Int
        var selected:Bool
    }
    
    @IBOutlet weak var NumberOfRolls: UILabel!
    
    //dice images
    @IBOutlet weak var D1: UIButton!
    @IBOutlet weak var D2: UIButton!
    @IBOutlet weak var D3: UIButton!
    @IBOutlet weak var D4: UIButton!
    @IBOutlet weak var D5: UIButton!
    
    //bonus
    @IBOutlet weak var Bonus: UILabel!
    @IBOutlet weak var P1BonusLabel: UILabel!
    @IBOutlet weak var P2BonusLabel: UILabel!
    
    //totals
    @IBOutlet weak var Total: UILabel!
    @IBOutlet weak var P1TotalLabel: UILabel!
    @IBOutlet weak var P2TotalLabel: UILabel!
    
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
    @IBOutlet weak var P1SmStraight: UILabel!
    @IBOutlet weak var P1Lstraight: UILabel!
    @IBOutlet weak var P1Yacht: UILabel!
    //2nd column Player 2
    @IBOutlet weak var P2Free: UILabel!
    @IBOutlet weak var P2FourOfKind: UILabel!
    @IBOutlet weak var P2FullHouse: UILabel!
    @IBOutlet weak var P2SmStraight: UILabel!
    @IBOutlet weak var P2LStraight: UILabel!
    @IBOutlet weak var P2Yacht: UILabel!

    @IBAction func ResetButton(_ sender: Any) {
        gameReset()
    }
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
        if(count<=2){
            diceRoll[0].selected.toggle()
            num = diceRoll[0].value
            if(diceRoll[0].selected==true){
                D1.setImage(UIImage(named: "D\(num)Highlight"), for: .normal)
            }else{
                D1.setImage(UIImage(named: "Dice\(num)"), for: .normal)
            }
        }
    }
    
    @IBAction func D2Tap(_ sender: Any) {
        if(count<=2){
            diceRoll[1].selected.toggle()
            num = diceRoll[1].value
            if(diceRoll[1].selected==true){
                D2.setImage(UIImage(named: "D\(num)Highlight"), for: .normal)
            }else{
                D2.setImage(UIImage(named: "Dice\(num)"), for: .normal)
            }
        }
    }
    
    @IBAction func D3Tap(_ sender: Any) {
        if(count<=2){
            diceRoll[2].selected.toggle()
            num = diceRoll[2].value
            if(diceRoll[2].selected==true){
                D3.setImage(UIImage(named: "D\(num)Highlight"), for: .normal)
            }else{
                D3.setImage(UIImage(named: "Dice\(num)"), for: .normal)
            }
        }
    }
    
    @IBAction func D4Tap(_ sender: Any) {
        if(count<=2){
            diceRoll[3].selected.toggle()
            num = diceRoll[3].value
            if(diceRoll[3].selected==true){
                D4.setImage(UIImage(named: "D\(num)Highlight"), for: .normal)
            }else{
                D4.setImage(UIImage(named: "Dice\(num)"), for: .normal)
            }
        }
    }
    
    @IBAction func D5Tap(_ sender: Any) {
        if(count<=2){
            diceRoll[4].selected.toggle()
            num = diceRoll[4].value
            if(diceRoll[4].selected==true){
                D5.setImage(UIImage(named: "D\(num)Highlight"), for: .normal)
            }else{
                D5.setImage(UIImage(named: "Dice\(num)"), for: .normal)
            }
        }
    }
    
    //Left side buttons
    @IBAction func Ones(_ sender: Any) {
        if(count<=2){
            if(Player == 1){
                if let text1 = P1Ones.text, text1.isEmpty {
                    let current = calc.Ones(arr: diceRoll)
                    self.P1Ones.text = String(current)
                    P1Bonus.append(current)
                    P1TotalArr.append(current)
                    countdown -= 1
                    nextPlayer()
                }
            }
            else {
                if let text2 = P2Ones.text, text2.isEmpty {
                    let current = calc.Ones(arr: diceRoll)
                    self.P2Ones.text = String(current)
                    P2Bonus.append(current)
                    P2TotalArr.append(current)
                    countdown -= 1
                    nextPlayer()
                }
            }
            BonusPoints()
            calculateTotal()
        }
    }
    @IBAction func Twos(_ sender: Any) {
        if(count<=2){
            if(Player == 1){
                if let text1 = P1Twos.text, text1.isEmpty {
                    let current = calc.Twos(arr: diceRoll)
                    self.P1Twos.text = String(current)
                    P1Bonus.append(current)
                    P1TotalArr.append(current)
                    countdown -= 1
                    nextPlayer()
                }

            }
            else {
                if let text2 = P2Twos.text, text2.isEmpty {
                    let current = calc.Twos(arr: diceRoll)
                    self.P2Twos.text = String(current)
                    P2Bonus.append(current)
                    P2TotalArr.append(current)
                    countdown -= 1
                    nextPlayer()
                }
            }
            BonusPoints()
            calculateTotal()
        }
    }
    @IBAction func Threes(_ sender: Any) {
        if(count<=2){
            if(Player == 1){
                if let text1 = P1Threes.text, text1.isEmpty {
                    let current = calc.Threes(arr: diceRoll)
                    self.P1Threes.text = String(current)
                    P1Bonus.append(current)
                    P1TotalArr.append(current)
                    countdown -= 1
                    nextPlayer()
                }

            }
            else {
                if let text2 = P2Threes.text, text2.isEmpty {
                    let current = calc.Threes(arr: diceRoll)
                    self.P2Threes.text = String(current)
                    P2Bonus.append(current)
                    P2TotalArr.append(current)
                    countdown -= 1
                    nextPlayer()
                }
            }
            BonusPoints()
            calculateTotal()
        }
        
    }
    @IBAction func Fours(_ sender: Any) {
        if(count<=2){
            if(Player == 1){
                if let text1 = P1Fours.text, text1.isEmpty {
                    let current = calc.Fours(arr: diceRoll)
                    self.P1Fours.text = String(current)
                    P1Bonus.append(current)
                    P1TotalArr.append(current)
                    countdown -= 1
                    nextPlayer()
                }

            }
            else {
                if let text2 = P2Fours.text, text2.isEmpty {
                    let current = calc.Fours(arr: diceRoll)
                    self.P2Fours.text = String(current)
                    P2Bonus.append(current)
                    P2TotalArr.append(current)
                    countdown -= 1
                    nextPlayer()
                }
            }
            BonusPoints()
            calculateTotal()
        }
    }
    @IBAction func Fives(_ sender: Any) {
        if(count<=2){
            if(Player == 1){
                if let text1 = P1Fives.text, text1.isEmpty {
                    let current = calc.Fives(arr: diceRoll)
                    self.P1Fives.text = String(current)
                    P1Bonus.append(current)
                    P1TotalArr.append(current)
                    countdown -= 1
                    nextPlayer()
                }

            }
            else {
                if let text2 = P2Fives.text, text2.isEmpty {
                    let current = calc.Fives(arr: diceRoll)
                    self.P2Fives.text = String(current)
                    P2Bonus.append(current)
                    P2TotalArr.append(current)
                    countdown -= 1
                    nextPlayer()
                }
            }
            BonusPoints()
            calculateTotal()
        }
    }
    @IBAction func Sixes(_ sender: Any) {
        if(count<=2){
            if(Player == 1){
                if let text1 = P1Sixes.text, text1.isEmpty {
                    let current = calc.Sixes(arr: diceRoll)
                    self.P1Sixes.text = String(current)
                    P1Bonus.append(current)
                    P1TotalArr.append(current)
                    countdown -= 1
                    nextPlayer()
                }

            }
            else {
                if let text2 = P2Sixes.text, text2.isEmpty {
                    let current = calc.Sixes(arr: diceRoll)
                    self.P2Sixes.text = String(current)
                    P2Bonus.append(current)
                    P2TotalArr.append(current)
                    countdown -= 1
                    nextPlayer()
                }
            }
            BonusPoints()
            calculateTotal()
        }
        
    }
    func BonusPoints(){
        if(P1Bonus.count==6){
            if(calc.bonus(arr: P1Bonus)){
                self.P1BonusLabel.text = "35"
                P1TotalArr.append(35)
            }else{
                self.P1BonusLabel.text="0"
            }
        }
        if(P2Bonus.count==6){
            if(calc.bonus(arr: P2Bonus)){
                self.P2BonusLabel.text = "35"
                P2TotalArr.append(35)
            }else{
                self.P2BonusLabel.text="0"
            }
        }
    }
    
    //Right side buttons
    @IBAction func Free(_ sender: Any) {
        if(count<=2){
            if(Player == 1){
                if let text1 = P1Free.text, text1.isEmpty {
                    let current = calc.freeHand(arr: diceRoll)
                    self.P1Free.text = String(current)
                    P1TotalArr.append(current)
                    countdown -= 1
                    nextPlayer()
                }
            }
            else {
                if let text2 = P2Free.text, text2.isEmpty {
                    let current = calc.freeHand(arr: diceRoll)
                    self.P2Free.text = String(current)
                    P2TotalArr.append(current)
                    countdown -= 1
                    nextPlayer()
                }
            }
            calculateTotal()
        }
    }
    
    @IBAction func FourOfKind(_ sender: Any) {
        if(count<=2){
            if Player == 1 {
                if let text1 = P1FourOfKind.text, text1.isEmpty{
                    let current = calc.FourKinds(arr: diceRoll)
                    self.P1FourOfKind.text = String(current)
                    P1TotalArr.append(current)
                    countdown -= 1
                    nextPlayer()
                }
            }else{
                if let text2 = P2FourOfKind.text, text2.isEmpty{
                    let current = calc.FourKinds(arr: diceRoll)
                    self.P2FourOfKind.text = String(current)
                    P2TotalArr.append(current)
                    countdown -= 1
                    nextPlayer()
                }
            }
            calculateTotal()
        }
    }
    @IBAction func Fullhouse(_ sender: Any) {
        if(count<=2){
            if Player == 1 {
                if let text1 = P1FullHouse.text, text1.isEmpty{
                    let current = calc.FullHouse(arr: diceRoll)
                    self.P1FullHouse.text = String(current)
                    P1TotalArr.append(current)
                    countdown -= 1
                    nextPlayer()
                }
            }else{
                if let text2 = P2FullHouse.text, text2.isEmpty{
                    let current = calc.FullHouse(arr: diceRoll)
                    self.P2FullHouse.text = String(current)
                    P2TotalArr.append(current)
                    countdown -= 1
                    nextPlayer()
                }
            }
            calculateTotal()
        }
    }
    @IBAction func SStraight(_ sender: Any) {
        if(count<=2){
            if Player == 1 {
                if let text1 = P1SmStraight.text, text1.isEmpty{
                    let current = calc.SmallStraight(arr: diceRoll)
                    self.P1SmStraight.text = String(current)
                    P1TotalArr.append(current)
                    countdown -= 1
                    nextPlayer()
                }
            }else{
                if let text2 = P2SmStraight.text, text2.isEmpty{
                    let current = calc.SmallStraight(arr: diceRoll)
                    self.P2SmStraight.text = String(current)
                    P2TotalArr.append(current)
                    countdown -= 1
                    nextPlayer()
                }
            }
            calculateTotal()
        }
    }
    @IBAction func LStraight(_ sender: Any) {
        if(count<=2){
            if Player == 1 {
                if let text1 = P1Lstraight.text, text1.isEmpty{
                    let current = calc.LargeStraight(arr: diceRoll)
                    self.P1Lstraight.text = String(current)
                    P1TotalArr.append(current)
                    countdown -= 1
                    nextPlayer()
                }
            }else{
                if let text2 = P2LStraight.text, text2.isEmpty{
                    let current = calc.LargeStraight(arr: diceRoll)
                    self.P2LStraight.text = String(current)
                    P2TotalArr.append(current)
                    countdown -= 1
                    nextPlayer()
                }
            }
            calculateTotal()
        }
    }
    @IBAction func Yacht(_ sender: Any) {
        if(count<=2){
            if Player == 1 {
                if let text1 = P1Yacht.text, text1.isEmpty{
                    let current = calc.Yacht(arr: diceRoll)
                    self.P1Yacht.text = String(current)
                    P1TotalArr.append(current)
                    countdown -= 1
                    nextPlayer()
                }
            }else{
                if let text2 = P2Yacht.text, text2.isEmpty{
                    let current = calc.Yacht(arr: diceRoll)
                    self.P2Yacht.text = String(current)
                    P2TotalArr.append(current)
                    countdown -= 1
                    nextPlayer()
                }
            }
            calculateTotal()
        }
        
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
        diceRoll[0].selected=false
        diceRoll[1].selected=false
        diceRoll[2].selected=false
        diceRoll[3].selected=false
        diceRoll[4].selected=false


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
    
    func calculateTotal(){
        if(countdown==0){
            var i = 0
            var j = 0
            var totalP1 = 0
            var totalP2 = 0
            for _ in P1TotalArr{
                totalP1+=P1TotalArr[i]
                i += 1
            }
            for _ in P2TotalArr{
                totalP2+=P2TotalArr[j]
                j += 1
            }
            self.P1TotalLabel.text = String(totalP1)
            self.P2TotalLabel.text = String(totalP2)
            if(totalP1>totalP2){
                let alert1 = UIAlertController(title: "The Winner is...", message: "Player 1!!!", preferredStyle: .alert)
                alert1.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert1, animated: true)
            }else{
                let alert2 = UIAlertController(title: "The Winner is...", message: "Player 2!!!", preferredStyle: .alert)
                alert2.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert2, animated: true)
            }
            
        }
    }
    func gameReset()  {
        countdown = 24
        P1Bonus=[]
        P2Bonus=[]
        P1TotalArr=[]
        P2TotalArr=[]
        //P1 reset
        self.P1Ones.text=""
        self.P1Twos.text=""
        self.P1Threes.text=""
        self.P1Fours.text=""
        self.P1Fives.text=""
        self.P1Sixes.text=""
        
        self.P1Free.text=""
        self.P1FourOfKind.text=""
        self.P1FullHouse.text=""
        self.P1SmStraight.text=""
        self.P1Lstraight.text=""
        self.P1Yacht.text=""
        
        self.P1BonusLabel.text=""
        self.P1TotalLabel.text=""
        
        self.P2Ones.text=""
        self.P2Twos.text=""
        self.P2Threes.text=""
        self.P2Fours.text=""
        self.P2Fives.text=""
        self.P2Sixes.text=""
        
        self.P2Free.text=""
        self.P2FourOfKind.text=""
        self.P2FullHouse.text=""
        self.P2SmStraight.text=""
        self.P2LStraight.text=""
        self.P2Yacht.text=""
        
        self.P2BonusLabel.text=""
        self.P2TotalLabel.text=""
    }
    



    
}







