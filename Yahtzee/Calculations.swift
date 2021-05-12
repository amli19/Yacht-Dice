//
//  Calculations.swift
//  Yahtzee
//
//  Created by JPL-ST-SPRING2021 on 5/11/21.
//

import UIKit
class Calculations{
    var yachtDiceViewController = YachtDiceViewController()

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
    
    func parseValues()  {
        //insert values into temp array
        for _ in yachtDiceViewController.diceRoll {
            valueArray.append((yachtDiceViewController.diceRoll[currentIndex].value))
            currentIndex+=1
        }
    }

    //return amount of times number appears in array
    func countNum(num:Int)->Int{
        for _ in valueArray {
            if(valueArray.contains(num)){
                countNums+=1
            }
        }
        return countNums
    }
    func Ones() -> Int {
        return countNum(num: 1)

    }
    func Twos() -> Int {
        return countNum(num: 2)*2
    }
    func Threes() -> Int {
        return countNum(num: 2)*3
    }
    func Fours() -> Int {
        return countNum(num: 2)*4
    }
    func Fives() -> Int {
        return countNum(num: 2)*5
    }
    func Sixes() -> Int {
        return countNum(num: 2)*6
    }
    func Bonus()->Int{
        if(yachtDiceViewController.Player==1){
            return BonusP1()
        }
        if(yachtDiceViewController.Player==2){
            return BonusP2()
        }
        return 0
    }

    func freeHand() -> Int {
        score = 0
        i = 0
        for _ in valueArray {
            score += valueArray[i]
            i+=1
        }
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
    

    func FourKinds() -> Int {
        score = 0
        i = 0
        parseValues()
        if(countNum(num: 1) == 4||countNum(num: 2) == 4||countNum(num: 3) == 4||countNum(num: 4) == 4||countNum(num: 5) == 4||countNum(num: 6) == 4){
            for _ in valueArray {
                score += valueArray[i]
                i+=1
            }
        }
        return score
    }
    
    func FullHouse() -> Int {
        score = 0
        i = 0
        parseValues()
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
        return score
    }
    //1,2,3,4 or 2,3,4,5 or 3,4,5,6
    func SmallStraight() -> Int {
        score = 0
        parseValues()
        if((countNum(num: 1) == 1 && countNum(num: 2) == 1 && countNum(num: 3) == 1 && countNum(num: 4) == 1) ||
           (countNum(num: 2) == 1 && countNum(num: 3) == 1 && countNum(num: 4) == 1 && countNum(num: 5) == 1) ||
           (countNum(num: 3) == 1 && countNum(num: 4) == 1 && countNum(num: 5) == 1 && countNum(num: 6) == 1)){
            score = 15
        }
        return score
    }
    //1,2,3,4,5 or 2,3,4,5,6
    func LargeStraight() -> Int {
        score = 0
        parseValues()
        if((countNum(num: 1) == 1 && countNum(num: 2) == 1 && countNum(num: 3) == 1 && countNum(num: 4) == 1 && countNum(num:5) == 1) ||
           (countNum(num: 2) == 1 && countNum(num: 3) == 1 && countNum(num: 4) == 1 && countNum(num: 5) == 1 && countNum(num: 6) == 1)){
            score = 30
        }
        return score
    }
    
    func Yahtzee() -> Int {
        score = 0
        if(countNum(num: 1) == 5 ||
           countNum(num: 2) == 5 ||
           countNum(num: 3) == 5 ||
           countNum(num: 4) == 5 ||
           countNum(num: 5) == 5 ||
           countNum(num: 6) == 5){
            score = 50
        }else{score = 0}
        return score
    }
    
    
    func BonusP1()->Int{
        if let text1 = yachtDiceViewController.P1Ones.text, text1.isEmpty{
            BonusArray.append(Int(text1) ?? 0)
        }
        if let text2 = yachtDiceViewController.P1Twos.text, text2.isEmpty{
            BonusArray.append(Int(text2) ?? 0)
        }
        if let text3 = yachtDiceViewController.P1Threes.text, text3.isEmpty{
            BonusArray.append(Int(text3) ?? 0)
        }
        if let text4 = yachtDiceViewController.P1Fours.text, text4.isEmpty{
            BonusArray.append(Int(text4) ?? 0)
        }
        if let text5 = yachtDiceViewController.P1Fives.text, text5.isEmpty{
            BonusArray.append(Int(text5) ?? 0)
        }
        if let text6 = yachtDiceViewController.P1Sixes.text, text6.isEmpty{
            BonusArray.append(Int(text6) ?? 0)
        }
        
        //add all values and compare
        score = 0
        i = 0
        for _ in BonusArray {
            score += BonusArray[i]
            i+=1
        }
        if(score >= 63){
            return 35
        }
        else{
            return 0
        }
        
    }
    func BonusP2()->Int{
        if let text1 = yachtDiceViewController.P2Ones.text, text1.isEmpty{
            BonusArray.append(Int(text1) ?? 0)
        }
        if let text2 = yachtDiceViewController.P2Twos.text, text2.isEmpty{
            BonusArray.append(Int(text2) ?? 0)
        }
        if let text3 = yachtDiceViewController.P2Threes.text, text3.isEmpty{
            BonusArray.append(Int(text3) ?? 0)
        }
        if let text4 = yachtDiceViewController.P2Fours.text, text4.isEmpty{
            BonusArray.append(Int(text4) ?? 0)
        }
        if let text5 = yachtDiceViewController.P2Fives.text, text5.isEmpty{
            BonusArray.append(Int(text5) ?? 0)
        }
        if let text6 = yachtDiceViewController.P2Sixes.text, text6.isEmpty{
            BonusArray.append(Int(text6) ?? 0)
        }
        
        //add all values and compare
        score = 0
        i = 0
        for _ in BonusArray {
            score += BonusArray[i]
            i+=1
        }
        if(score >= 63){
            return 35
        }
        else{
            return 0
        }
        
    }
    
    func registerTotalArray(chosen:Int){
        if(yachtDiceViewController.Player==1){
            P1Total.append(chosen)
        }
        else if(yachtDiceViewController.Player==2){
            P2Total.append(chosen)
        }
    }
    
    //calculates final total
    func Total(){
        for _ in P1Total {
            P1total += P1Total[i]
            i+=1
        }
        for _ in P2Total {
            P2total += P2Total[i]
            i+=1
        }
    }
}
