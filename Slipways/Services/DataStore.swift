//
//  DataStore.swift
//  Slipways
//
//  Created by Marcel Benders on 21.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import Foundation

class DataStore: ObservableObject{
    @Published var stations: [Station]
    @Published var slipways: [Slipway]
    @Published var waters: [Water]
    
    init() {
        stations = [Station]()
        slipways = [Slipway]()
        waters = [Water]()
    }
    
    func getStations() -> [Station] {
        if(stations.count == 0){
            let service = SlipwayService<Station>()
            service.fetchData(link: Links().stations) { (stations) in
                self.stations = stations
            }
        }
        return stations
    }
    
    func getWaters() -> [Water] {
        if(waters.count == 0){
            let service = SlipwayService<Water>()
            service.fetchData(link: Links().waters) { (waters) in
                self.waters = waters
            }
        }
        return waters
    }
    
    func getWaters() -> [Slipway] {
        if(waters.count == 0){
            let service = SlipwayService<Slipway>()
            service.fetchData(link: Links().slipways) { (slipways) in
                self.slipways = slipways
            }
        }
        return slipways
    }
}
