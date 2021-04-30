//
//  BossFightViewController.swift
//  WanderingSeoulBeta1.0
//
//  Created by CSUFTitan on 12/2/20.
//  Copyright © 2020 Matheo. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit


class BossFightViewController: UIViewController {

    var theMonster = monster(100)
    var numCoins : Int = 0
    @IBOutlet weak var hpLabel: UILabel!
    @IBOutlet weak var coinsLabel : UILabel!
    @IBAction func attackButtonPressed(){
        hpLabel.text = "HP: " + String(theMonster.hit(25, " "))
        if (theMonster.getHp() <= 0) {
            numCoins += 1
            coinsLabel.text = "Coins: " + String(numCoins)
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        guard let firstVC = segue.destination as? GameViewController else {return}
//        firstVC
//
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hpLabel.text = "HP: 100"
        coinsLabel.text = "Coins: " + String(numCoins)
    }
    
}
