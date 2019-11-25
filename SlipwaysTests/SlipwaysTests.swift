//
//  SlipwaysTests.swift
//  SlipwaysTests
//
//  Created by Marcel Benders on 31.10.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import XCTest
@testable import Slipways

class StationServiceMock: StationProtocol{
    func fetchData(link: String, completion: @escaping ([Station]) -> Void) {
        let stations = [Station(id: "12345", number: "001", shortname: "Test", longname: "Teststation", km: 22.2, agency: "Riga", longitude: 2.2, latitude: 2.2, waterFk: "abc", water: Water(id: "12345", shortname: "RUHR", longname: "RUHR"))]
        completion(stations)
    }
    
    func fetchSingleData(link: String, completion: @escaping (Station?) -> Void) {
        completion(nil)
    }
    
    func fetchSingleData(link: String) {
        print("fetchSingleData called")
    }
}

class WaterServiceMock : WaterProtocol{
    func fetchData(link: String, completion: @escaping ([Water]) -> Void) {
        completion([Water]())
    }
    
    func fetchSingleData(link: String, completion: @escaping (Water?) -> Void) {
        completion(nil)
    }
    
    func fetchSingleData(link: String) {
        print("fetchSingleData called")
    }
    
}

class SlipwaysTests: XCTestCase {

    var dataStore: DataStore?
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        dataStore = DataStore(WaterServiceMock(), StationServiceMock())
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetStationsReturnsInstanceWithZeroValues() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let stations = dataStore!.getStations()
        
        XCTAssert(stations.count > 0, "Stations have more than one element")
    }
    
    func testGetWatersReturnsInstanceWithZeroValues() {
         // This is an example of a functional test case.
         // Use XCTAssert and related functions to verify your tests produce the correct results.
         let waters = dataStore!.getWaters()
         
         XCTAssert(waters.count == 0)
     }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
