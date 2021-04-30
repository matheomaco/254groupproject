//
//  Player.swift
//  WanderingSeoulBeta1.0
//
//  Created by CSUFTitan on 12/6/20.
//  Copyright © 2020 Matheo. All rights reserved.
//

import Foundation
import UIKit
class Player: Codable {
    var coins: Int
    var inventory: [String: Int] // value is the amount of the item
    init() {
        coins = 0
        inventory = [:]
    }
    
    func getCoins() -> Int {
        return coins
    }
    
    func setCoins(_ numCoins: Int) {
        coins = numCoins
    }
    
    func buy(name: String, blacksmith: Blacksmith) {
        if coins >= blacksmith.inventory[name]! {
            if let oldValues = inventory[name] {
                inventory.updateValue(oldValues + 1, forKey: name)
            } else {
                inventory = [name: 1]
            }
            coins -= blacksmith.inventory[name]!
        }
    }
}
