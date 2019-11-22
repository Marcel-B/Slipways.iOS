//
//  SlipwaysTests.swift
//  SlipwaysTests
//
//  Created by Marcel Benders on 31.10.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import XCTest
@testable import Slipways

class SlipwaysTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetStationsReturnsInstanceWithZeroValues() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        var dataStore = DataStore()
        let stations = dataStore.getStations()
        
        XCTAssert(stations.count > 0, "Stations have more than one element")
    }
    
    func testGetWatersReturnsInstanceWithZeroValues() {
         // This is an example of a functional test case.
         // Use XCTAssert and related functions to verify your tests produce the correct results.
         let dataStore = DataStore()
         let waters = dataStore.getWaters()
         
         XCTAssert(waters.count == 0)
     }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
