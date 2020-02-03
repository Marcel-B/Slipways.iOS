//
//  SlipwaysTests.swift
//  SlipwaysTests
//
//  Created by Marcel Benders on 31.10.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import XCTest
@testable import Slipways

//class StationServiceMock: StationProtocol{
//    func getStations(completion: @escaping ([Station]?, Error?) -> Void) {
//
//    }
//
//
//    func fetchData(link: String, completion: @escaping ([Station]) -> Void) {
//        let stations = [Station(id: "12345", number: "001", shortname: "Test", longname: "Teststation", km: 22.2, agency: "Riga", longitude: 2.2, latitude: 2.2, waterFk: "abc", water: Water(id: "12345", shortname: "RUHR", longname: "RUHR"))]
//        completion(stations)
//    }
//
//    func fetchSecureSingleData(link: String, completion: @escaping (Station?) -> Void) {
//        completion(nil)
//    }
//
//    func fetchSingleData(link: String) {
//        print("fetchSingleData called")
//    }
//}

//class WaterServiceMock : WaterProtocol{
//    func getWaters(completion: @escaping ([Water]?, Error?) -> Void) {
//            
//    }
//    
//    func fetchData(link: String, completion: @escaping ([Water]) -> Void) {
//        completion([Water]())
//    }
//    
//    func fetchSecureSingleData(link: String, completion: @escaping (Water?) -> Void) {
//        completion(nil)
//    }
//    
//    func fetchSingleData(link: String) {
//        print("fetchSingleData called")
//    }
//    
//}

class PegelDataMock: PegelData{
    func getPegel(data: Data, completion: @escaping (CurrentMeasurementResponse?) -> Void) {
        let response = CurrentMeasurementResponse(shortname: "Long", longname: "Short", unit: "fo", equidistance: 1, currentMeasurement: CurrentMeasurement(timestamp: "11", value: 2.2, trend: 2, stateMnwMhw: "ll", stateNswHsw: "ll"), gaugeZero: GaugeZero(unit: "kk", value: 2.2, validFrom: "kj"))
        completion(response)
    }
}

class PegelServiceMock: PegelProtocol{
    func getPegel(station: String, completion: @escaping (Data?) -> Void) {
        
    }
    
    
}
class Eins{
    var name: String
    var vorname: String
    init(name: String, vorname: String) {
        self.name = name
        self.vorname = vorname
    }
}

class EinsQl{
    init() {
        nameQl = ""
        vornameQl = ""
    }
    var nameQl: String
    var vornameQl: String
}

extension Eins{
    func wrapIt(_ einsQl: EinsQl){
        self.name = einsQl.nameQl
        self.vorname = einsQl.vornameQl
    }
}

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
        let a = Eins(name: "Benders", vorname: "Marcel")
        let b = EinsQl()
        
        b.nameQl = "Floppes"
        b.vornameQl = "Harry"
        
        a.wrapIt(b)
        
        print(a.name)
        print(a.vorname)
        
    }
    
    func testGetWatersReturnsInstanceWithZeroValues() {
         // This is an example of a functional test case.
         // Use XCTAssert and related functions to verify your tests produce the correct results.
         
         
         
     }
    
    func testGetPegelReturnsInstanceWithZeroValues() {
            // This is an example of a functional test case.
            // Use XCTAssert and related functions to verify your tests produce the correct results.
        let str = "ALLER".lowercased()
        let result = str.capitalizingFirstLetter()
        print(result)
        XCTAssert(result == "Aller")
        }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
