//
//  Blacksmith.swift
//  WanderingSeoulBeta1.0
//
//  Created by Hung Cun on 12/7/20.
//  Copyright © 2020 Matheo. All rights reserved.
//

import Foundation

class Blacksmith {
    init() {
        inventory = ["무기": 10, "갑옷": 15]
        // 무기:mugi(weapon), 갑옷:gabos(armor), value of inventory is the price of the item
    }

    var inventory: [String: Int]
}
