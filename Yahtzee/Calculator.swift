

import Foundation
//protocol CalculationsDelegate {
//    func Twos()->Int
//}

public class Calculator{
    //var yachtDiceViewController = YachtDiceViewController()

    var valueArray:[Int]=[]
    var currentIndex = 0
    var countNums = 0
    var score = 0 //
    var i = 0 //for arrays to keep track
    var P1total=0
    var P2total=0
    var BonusArray:[Int]=[]
    var P1Total:[Int]=[]
    var P2Total:[Int]=[]
    var unique=false
    
    func parseValues(arrInt:[Yahtzee.YachtDiceViewController.Dice])  {
        //insert values into value array
        currentIndex=0
        for _ in arrInt {
            valueArray.append((arrInt[currentIndex].value))
            currentIndex+=1
        }
    }

    //return amount of times number appears in array
    func countNum(num:Int)->Int{
        countNums = 0
        currentIndex=0
        for _ in valueArray {
            if(valueArray[currentIndex]==num){
                countNums+=1
            }
            currentIndex+=1
        }
        if(unique==false){
            valueArray.removeAll()//reset value array here
        }
        return countNums
    }
    

    func Ones(arr:[Yahtzee.YachtDiceViewController.Dice]) -> Int {
        unique=false
        parseValues(arrInt: arr)
        return countNum(num: 1)*1
    }
    func Twos(arr:[Yahtzee.YachtDiceViewController.Dice]) -> Int {
        unique=false
        parseValues(arrInt: arr)
        return countNum(num: 2)*2
    }
    func Threes(arr:[Yahtzee.YachtDiceViewController.Dice]) -> Int {
        unique=false
        parseValues(arrInt: arr)
        return countNum(num: 3)*3
    }
    func Fours(arr:[Yahtzee.YachtDiceViewController.Dice]) -> Int {
        unique=false
        parseValues(arrInt: arr)
        return countNum(num: 4)*4
    }
    func Fives(arr:[Yahtzee.YachtDiceViewController.Dice]) -> Int {
        unique=false
        parseValues(arrInt: arr)
        return countNum(num: 5)*5
    }
    func Sixes(arr:[Yahtzee.YachtDiceViewController.Dice]) -> Int {
        unique=false
        parseValues(arrInt: arr)
        return countNum(num: 6)*6
    }
//    func Bonus()->Int{
//        if(yachtDiceViewController.Player==1){
//            return BonusP1()
//        }
//        if(yachtDiceViewController.Player==2){
//            return BonusP2()
//        }
//        return 0
//    }

    func freeHand(arr:[Yahtzee.YachtDiceViewController.Dice]) -> Int {
        score = 0
        i = 0
        unique=true
        parseValues(arrInt: arr)
        for _ in valueArray {
            score += valueArray[i]
            i+=1
        }
        valueArray.removeAll()
        return score
    }
    //func ThreeKinds() -> Int {
    //    score = 0
    //    i = 0
    //    parseValues()
    //    if(countNum(num: 1) == 3||countNum(num: 2) == 3||countNum(num: 3) == 3||countNum(num: 4) == 3||countNum(num: 5) == 3||countNum(num: 6) == 3){
    //        for _ in valueArray {
    //            score += valueArray[i]
    //            i+=1
    //        }
    //    }
    //    return score
    //}
    

    func FourKinds(arr:[Yahtzee.YachtDiceViewController.Dice]) -> Int {
        score = 0
        i = 0
        unique=true
        parseValues(arrInt: arr)
        if(countNum(num: 1) == 4||countNum(num: 2) == 4||countNum(num: 3) == 4||countNum(num: 4) == 4||countNum(num: 5) == 4||countNum(num: 6) == 4){
            for _ in valueArray {
                score += valueArray[i]
                i+=1
            }
        }
        valueArray.removeAll()
        return score
    }

    func FullHouse(arr:[Yahtzee.YachtDiceViewController.Dice]) -> Int {
        score = 0
        i = 0
        unique=true
        parseValues(arrInt: arr)
        //check for triples then doubles
        if((countNum(num: 1) == 3 ||
           countNum(num: 2) == 3 ||
           countNum(num: 3) == 3 ||
           countNum(num: 4) == 3 ||
           countNum(num: 5) == 3 ||
           countNum(num: 6) == 3) && (
           countNum(num: 1) == 2 ||
           countNum(num: 2) == 2 ||
           countNum(num: 3) == 2 ||
           countNum(num: 4) == 2 ||
           countNum(num: 5) == 2 ||
           countNum(num: 6) == 2)){
            for _ in valueArray {
                score += valueArray[i]
                i+=1
            }
        }
        valueArray.removeAll()
        return score
    }
    //1,2,3,4 or 2,3,4,5 or 3,4,5,6
    func SmallStraight(arr:[Yahtzee.YachtDiceViewController.Dice]) -> Int {
        score = 0
        unique=true
        parseValues(arrInt: arr)
        if((countNum(num: 1) == 1 && countNum(num: 2) == 1 && countNum(num: 3) == 1 && countNum(num: 4) == 1) ||
           (countNum(num: 2) == 1 && countNum(num: 3) == 1 && countNum(num: 4) == 1 && countNum(num: 5) == 1) ||
           (countNum(num: 3) == 1 && countNum(num: 4) == 1 && countNum(num: 5) == 1 && countNum(num: 6) == 1)){
            score = 15
        }
        valueArray.removeAll()
        return score
    }
    //1,2,3,4,5 or 2,3,4,5,6
    func LargeStraight(arr:[Yahtzee.YachtDiceViewController.Dice]) -> Int {
        score = 0
        unique=true
        parseValues(arrInt: arr)
        if((countNum(num: 1) == 1 && countNum(num: 2) == 1 && countNum(num: 3) == 1 && countNum(num: 4) == 1 && countNum(num:5) == 1) ||
           (countNum(num: 2) == 1 && countNum(num: 3) == 1 && countNum(num: 4) == 1 && countNum(num: 5) == 1 && countNum(num: 6) == 1)){
            score = 30
        }
        valueArray.removeAll()
        return score
    }

    func Yacht(arr:[Yahtzee.YachtDiceViewController.Dice]) -> Int {
        score = 0
        unique=true
        parseValues(arrInt: arr)
        if(countNum(num: 1) == 5 ||
           countNum(num: 2) == 5 ||
           countNum(num: 3) == 5 ||
           countNum(num: 4) == 5 ||
           countNum(num: 5) == 5 ||
           countNum(num: 6) == 5){
            score = 50
        }else{score = 0}
        valueArray.removeAll()
        return score
    }

    //check for bonus
    func bonus(arr:[Int])->Bool{
        score = 0
        i = 0
        for _ in arr {
            score += arr[i]
            i+=1
        }
        if(score >= 63){
            return true
        }
        else{
            return false
        }
    }

}
