//
//  Singles.swift
//  Yahtzee
//
//  Created by JPL-ST-SPRING2021 on 5/11/21.
//

import UIKit
var yahtzeeViewController: YahtzeeViewController?

var count = 0
var valueArray:[Int]=[]
var currentIndex = 0
//func CalculateSingles(){
//    //insert values into temparray
//
//    var valueArray:[Int]=[]
//    var currentIndex = 0
//    while (currentIndex<6) {
//        valueArray.append((yahtzeeViewController?.diceRoll[currentIndex].value)!)
//        currentIndex+=1
//    }
//    //counting how many of each type of numbers there are
//    var numOf1 = 0
//    var numOf2 = 0
//    var numOf3 = 0
//    var numOf4 = 0
//    var numOf5 = 0
//    var numOf6 = 0
//    for _ in valueArray{
//        if(valueArray.contains(1)){
//            numOf1+=1
//        }
//        if(valueArray.contains(2)){
//            numOf2+=1
//        }
//        if(valueArray.contains(3)){
//            numOf3+=1
//        }
//        if(valueArray.contains(4)){
//            numOf4+=1
//        }
//        if(valueArray.contains(5)){
//            numOf5+=1
//        }
//        if(valueArray.contains(6)){
//            numOf6+=1
//        }
//    }
//}
func parseValues()  {
    //insert values into temp array
    for _ in yahtzeeViewController?.diceRoll {
        valueArray.append((yahtzeeViewController?.diceRoll[currentIndex].value)!)
        currentIndex+=1
    }
}
func countNum(num:Int)->Int{
    parseValues()
    for _ in valueArray {
        if(valueArray.contains(num)){
            count+=1
        }
    }
    return count
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
