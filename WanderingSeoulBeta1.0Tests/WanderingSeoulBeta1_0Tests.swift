//
//  WanderingSeoulBeta1_0Tests.swift
//  WanderingSeoulBeta1.0Tests
//
//  Created by Matheo on 10/16/20.
//  Copyright © 2020 Matheo. All rights reserved.
//

import XCTest
@testable import WanderingSeoulBeta1_0

class WanderingSeoulBeta1_0Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
//func test_simpleEnum_withoutAssociatedValues() throws {
//    let result = simplePlayer
//    XCTAssertEqual(result, .player)
//}
//    func test_simpleEnum_withoutAssociatedValues() throws {
//    let result = simpleBlock
//    XCTAssertEqual(result, .block)
//}
//func test_simpleEnum_withoutAssociatedValues() throws {
//    let result = simpleVortex
//    XCTAssertEqual(result, .vortex)
//}
//    func test_simpleEnum_withoutAssociatedValues() throws {
//    let result = simpleStar
//    XCTAssertEqual(result, .star)
//}
    func testBuy1() {
        let user = Player()
        let blacksmith = Blacksmith()

        user.buy(name: "무기", blacksmith: blacksmith)
        XCTAssertEqual(user.inventory["무기"], 0)
    }

    func testBuy2() {
        let user = Player()
        let blacksmith = Blacksmith()
        user.setCoins(20)
        user.buy(name: "무기", blacksmith: blacksmith)
        XCTAssertEqual(user.inventory["무기"], 1)
    }

    func testnumberofItem() {
        let user = Player()
        let blacksmith = Blacksmith()
        user.setCoins(10)
        user.inventory = ["무기": 1]
        user.buy(name: "무기", blacksmith: blacksmith)
        XCTAssertEqual(user.inventory["무기"], 1)
    }
}
