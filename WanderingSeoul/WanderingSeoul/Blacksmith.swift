//
//  BlackSmith.swift
//  WanderingSeoul
//
//  Created by Hung Cun on 10/17/20.
//  Copyright © 2020 Hung Cun. All rights reserved.
//

import Foundation

struct BlackSmith {
    init() {
        inventory = ["검": 5,"책":10]
        //검:geom(sword), 책:chaeg(book), 선 물약: seon mul-yag(Zen potion),치유 물약:chiyu mul-yag
        //(heal potion), value of inventory is the price of the item
    }
    var inventory: [String:Int]
    
    func printItem() {
        for (keys,values) in inventory {
        print("\(keys)      \(values)")
        }
    }
    
    func welcome() {
        print("안녕하세요!") // Hello
    }
    
    mutating func buy(name: String, value: Int, user: User) {
        if user.credit == inventory[name] {
            if let oldValues = user.inventory[name] {
                user.inventory.updateValue(oldValues + 1, forKey: name)
            }else {
                user.inventory.updateValue(1, forKey: name)
            }
            user.credit -= inventory[name]!
        } else {
            print("돈이 충분치 않다")
        }
    }

}
