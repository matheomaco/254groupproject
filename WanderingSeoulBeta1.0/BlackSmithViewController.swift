//
//  BlackSmithViewController.swift
//  WanderingSeoulBeta1.0
//
//  Created by CSUFTitan on 12/6/20.
//  Copyright © 2020 Matheo. All rights reserved.
//

import Foundation
import GameplayKit
import SpriteKit
import UIKit
class BlackSmithViewController: UIViewController {
    @IBOutlet var transactionLabel: UILabel!
    @IBOutlet var transactionResultView: UIView!
    @IBOutlet var coinsLabel: UILabel!
    
    var numCoins: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        transactionResultView.backgroundColor = UIColor(white: 1, alpha: 0.0)
        coinsLabel.text = "Coins: " + String(numCoins)
    }
    
    @IBAction func buyArmorButton() {
        if numCoins >= 15 {
            buySuccessAnimation()
            numCoins -= 15
            coinsLabel.text = "Coins: \(numCoins)"
        }
        else {
            buyFailureAnimation()
        }
    }
    
    @IBAction func buySwordButton() {
        if numCoins >= 10 {
            buySuccessAnimation()
            numCoins -= 10
            coinsLabel.text = "Coins: \(numCoins)"
        }
        else {
            buyFailureAnimation()
        }
    }
    
    func buySuccessAnimation() {
        transactionLabel.text = "Bought!"
        transactionLabel.textColor = UIColor.green

        UIView.animate(withDuration: 1.0, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut, animations:
            { self.transactionResultView.alpha = 1.0 })
        UIView.animate(withDuration: 1.0, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut, animations:
            { self.transactionResultView.alpha = 0.0 })
    }
    
    func buyFailureAnimation() {
        transactionLabel.text = "Not enough coins!"
        transactionLabel.textColor = UIColor.red
        
        UIView.animate(withDuration: 1.0, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut, animations:
            { self.transactionResultView.alpha = 1.0 })
        UIView.animate(withDuration: 1.0, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut, animations:
            { self.transactionResultView.alpha = 0.0 })
    }
}
