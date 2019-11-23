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
    
    func getWatersByExpression(exp: (_ isIncluded: Water) -> Bool) -> [Water] {
        getWaters()
            .filter(exp)
    }
    
    func getWater(filter: String) -> [Water]{
        getWaters()
            .filter { (water) -> Bool in
                water.longname.lowercased().starts(with: filter.lowercased())
        }
    }
    
    func getByExpression(exp: (_ isIncluded: Station) throws -> Bool) -> [Station]{
        let st = getStations()
        do{
            return try st.filter(exp)
        }catch{
            print(error)
        }
        return [Station]()
    }
    
    func getStations(filter: String) -> [Station] {
        if(stations.count == 0){
            let service = SlipwayService<Station>()
            service.fetchData(link: Links().stations) { (stations) in
                self.stations = stations
            }
        }
        return stations.filter { (station) -> Bool in
            station.longname.lowercased().starts(with: filter.lowercased())
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
    
    func getWaters() -> [Water] {
        if(waters.count == 0){
            let service = SlipwayService<Water>()
            service.fetchData(link: Links().waters) { (waters) in
                self.waters = waters
            }
        }
        return waters
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
}