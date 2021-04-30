//
//  Monster.swift
//  WanderingSeoul
//
//  Created by Hung Cun on 11/11/20.
//  Copyright © 2020 Hung Cun. All rights reserved.
//

import Foundation


struct FireMonster {
    init () {
        level = 1.0
        name = "Fire Monster"
        attack = 15.0
        defend = 5.0
        health = 200.0
    }
    var health : Double
    var level : Double
    var name: String
    var image: String?
    var attack: Double
    var defend: Double
    
    mutating func block(user: User) {
        if Bool.random() == true {
            health = health - ((0.6 * user.attack) - defend)
        } else {
            health = health - (user.attack - defend)
        }
    }
    
    mutating func userAttack(user: User) {
        if user.attackType == .water {
            user.attack = user.attack * 3
            health = health - (user.attack - defend)
        } else {
            health = health - (user.attack - defend)
        }
    }
}

struct WaterMonster {
    init () {
        level = 1.0
        name = "Water Monster"
        attack = 15.0
        defend = 5.0
        health = 200.0
    }
    var health : Double
    var level : Double
    var name: String
    var image: String?
    var attack: Double
    var defend: Double
    
    mutating func block(user: User) {
        if Bool.random() == true {
            health = health - ((0.6 * user.attack) - defend)
        } else {
            health = health - (user.attack - defend)
        }
    }
    
    mutating func userAttack(user: User) {
        if user.attackType == .electricity {
            user.attack = user.attack * 3
            health = health - (user.attack - defend)
        } else {
            health = health - (user.attack - defend)
        }
    }
}

struct EarthMonster {
    init () {
        level = 1.0
        name = "Orc Earth"
        attack = 15.0
        defend = 5.0
        health = 200.0
    }
    var health : Double
    var level : Double
    var name: String
    var image: String?
    var attack: Double
    var defend: Double
    
    mutating func block(user: User) {
        if Bool.random() == true {
            health = health - ((0.6 * user.attack) - defend)
        } else {
            health = health - (user.attack - defend)
        }
    }
    
    mutating func userAttack(user: User) {
        if user.attackType == .fire {
            user.attack = user.attack * 3
            health = health - (user.attack - defend)
        } else {
            health = health - (user.attack - defend)
        }
    }
}

struct ElectricMonster {
    init () {
        level = 1.0
        name = "Electric Golem"
        attack = 15.0
        defend = 5.0
        health = 200.0
    }
    var health : Double
    var level : Double
    var name: String
    var image: String?
    var attack: Double
    var defend: Double
    
    mutating func block(user: User) {
        if Bool.random() == true {
            health = health - ((0.6 * user.attack) - defend)
        } else {
            health = health - (user.attack - defend)
        }
    }
    
    mutating func userAttack(user: User) {
        if user.attackType == .earth {
            user.attack = user.attack * 3
            health = health - (user.attack - defend)
        } else {
            health = health - (user.attack - defend)
        }
    }
}
