//
//  User.swift
//  WanderingSeoul
//
//  Created by Hung Cun on 10/26/20.
//  Copyright © 2020 Hung Cun. All rights reserved.
//

import Foundation


enum AttackType {
    case water, electricity, fire, earth
}
class User {
    init() {
        inventory = [:]
        attack = 30.0
        credit = 0
        defend = 15.0
        attackType = .earth
    }
    
    var credit: Int
    var inventory: [String: Int]
    var attack: Double
    var defend: Double
    var attackType: AttackType
}
