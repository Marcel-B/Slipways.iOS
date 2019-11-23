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
    
    static let shared = DataStore()
    
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
    
    func getSlipways() -> [Slipway] {
        if(waters.count == 0){
            let service = SlipwayService<Slipway>()
            service.fetchData(link: Links().slipways) { (slipways) in
                self.slipways = slipways
            }
        }
        return slipways
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
    
    func getStationsByExpression(exp: (_ isIncluded: Station) -> Bool) -> [Station]{
        getStations()
            .filter(exp)
    }
    
    func getSlipwaysByExpression(exp: (_ isIncluded: Slipway) -> Bool) -> [Slipway]{
        getSlipways()
            .filter(exp)
    }
    
    func getWatersByExpression(exp: (_ isIncluded: Water) -> Bool) -> [Water] {
        getWaters()
            .filter(exp)
    }
    
    func getStations(filter: String) -> [Station] {
         getStations()
            .filter { (station) -> Bool in
             station.longname.lowercased().starts(with: filter.lowercased())
         }
     }
   
    func getSlipways(filter: String) -> [Slipway]{
        getSlipways()
            .filter { (slipway) -> Bool in
                slipway.name.lowercased().starts(with: filter.lowercased())
        }
    }
    
    func getWaters(filter: String) -> [Water]{
        getWaters()
            .filter { (water) -> Bool in
                water.longname.lowercased().starts(with: filter.lowercased())
        }
    }
    
    func getWaters(completion: @escaping  (_ result: [Water]) -> Void){
        if(waters.count == 0){
            SlipwayService<Water>()
                .fetchData(link: Links().waters) { (waters) in
                    self.waters = waters
                    completion(waters)
            }
        }
        completion(waters)
    }
}
