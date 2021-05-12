//
//  Singles.swift
//  Yahtzee
//
//  Created by JPL-ST-SPRING2021 on 5/11/21.
//

import UIKit
var yahtzeeViewController = YahtzeeViewController()


var valueArray:[Int]=[]
var currentIndex = 0
var countNums = 0

func parseValues()  {
    //insert values into temp array
//    if let yat = yahtzeeViewController{
//        diceRoll =
//    }
    for _ in yahtzeeViewController.diceRoll {
        valueArray.append((yahtzeeViewController.diceRoll[currentIndex].value))
        currentIndex+=1
    }
}

func countNum(num:Int)->Int{
    parseValues()
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
    var free = 0
    var i = 0
    parseValues()
    for _ in valueArray {
        free += valueArray[i]
        i+=1
    }
    return free
}
func ThreeKinds() -> Int {
    <#function body#>
}
func fFourKinds() -> Int {
    <#function body#>
}
func FullHouse() -> Int {
    <#function body#>
}
func SmallStraight() -> Int {
    <#function body#>
}
func LargeStraight() -> Int {
    <#function body#>
}
func Yahtzee() -> Int {
    <#function body#>
}
