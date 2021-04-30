//
//  Monster.swift
//  WanderingSeoulBeta1.0
//
//  Created by Hung Cun on 12/7/20.
//  Copyright © 2020 Matheo. All rights reserved.
//

import Foundation
import UIKit
class monster {
    let MAX_HEALTH: Int
    var currentHealth: Int
    init(_ maxHP: Int) {
        MAX_HEALTH = maxHP
        currentHealth = maxHP
    }
    
    func hit(_ damage: Int, _ type: String) -> Int {
        guard damage < currentHealth else {
            currentHealth = 0
            return currentHealth
        }
        
        currentHealth -= damage
        return currentHealth
    }
    
    func getHp() -> Int {
        return currentHealth
    }
}
