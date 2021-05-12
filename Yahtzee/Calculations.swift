//
//  Calculations.swift
//  Yahtzee
//
//  Created by JPL-ST-SPRING2021 on 5/11/21.
//

import Foundation
class Calculations{
    var yahtzeeViewController = YahtzeeViewController()

    var valueArray:[Int]=[]
    var currentIndex = 0
    var countNums = 0
    var free = 0
    var i = 0
    init() {
        
    }
    func parseValues()  {
        //insert values into temp array
        for _ in yahtzeeViewController.diceRoll {
            valueArray.append((yahtzeeViewController.diceRoll[currentIndex].value))
            currentIndex+=1
        }
    }

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


    func FreeHand() -> Int {
        free = 0
        i = 0
        for _ in valueArray {
            free += valueArray[i]
            i+=1
        }
        return free
    }
    //func ThreeKinds() -> Int {
    //    free = 0
    //    i = 0
    //    parseValues()
    //    if(countNum(num: 1) == 3||countNum(num: 2) == 3||countNum(num: 3) == 3||countNum(num: 4) == 3||countNum(num: 5) == 3||countNum(num: 6) == 3){
    //        for _ in valueArray {
    //            free += valueArray[i]
    //            i+=1
    //        }
    //    }
    //    return free
    //}
    func FourKinds() -> Int {
        free = 0
        i = 0
        parseValues()
        if(countNum(num: 1) == 4||countNum(num: 2) == 4||countNum(num: 3) == 4||countNum(num: 4) == 4||countNum(num: 5) == 4||countNum(num: 6) == 4){
            for _ in valueArray {
                free += valueArray[i]
                i+=1
            }
        }
        return free
    }
    func FullHouse() -> Int {
        free = 0
        i = 0
        parseValues()
        if(countNum(num: 1) == 4||countNum(num: 2) == 4||countNum(num: 3) == 4||countNum(num: 4) == 4||countNum(num: 5) == 4||countNum(num: 6) == 4){
            for _ in valueArray {
                free += valueArray[i]
                i+=1
            }
        }
        return free
    }
    func SmallStraight() -> Int {
        return 0
    }
    func LargeStraight() -> Int {
        return 0
    }
    func Yahtzee() -> Int {
        free = 0
        if(countNum(num: 1) == 5||countNum(num: 2) == 5||countNum(num: 3) == 5||countNum(num: 4) == 5||countNum(num: 5) == 5||countNum(num: 6) == 5){
            free = 50
        }else{free = 0}
        return free
    }
}
