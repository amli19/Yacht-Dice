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


    
    @IBOutlet weak var D1: UIImageView!
    
    @IBOutlet weak var D2: UIImageView!
    
    @IBOutlet weak var D3: UIImageView!
    
    @IBOutlet weak var D4: UIImageView!
    
    @IBOutlet weak var D5: UIImageView!
    
    
    @IBAction func Roll(_ sender: Any) {
        //rolls random number from 1-6
        let D1Roll = arc4random_uniform(6) + 1
        let D2Roll = arc4random_uniform(6) + 1
        let D3Roll = arc4random_uniform(6) + 1
        let D4Roll = arc4random_uniform(6) + 1
        let D5Roll = arc4random_uniform(6) + 1
            
        //displays rolls
        D1.image = UIImage(named: "Dice\(D1Roll)")
        D2.image = UIImage(named: "Dice\(D2Roll)")
        D2.image = UIImage(named: "Dice\(D3Roll)")
        D2.image = UIImage(named: "Dice\(D4Roll)")
        D2.image = UIImage(named: "Dice\(D5Roll)")
    }
    
}







