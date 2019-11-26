//
//  DataStore.swift
//  Slipways
//
//  Created by Marcel Benders on 21.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import Foundation

final class DataStore: ObservableObject{
    @Published var stations: [Station]
    @Published var slipways: [Slipway]
    @Published var waters: [Water]
    @Published var userSettings: [SlipwayDb]
    @Published var showFavoritesOnly: Bool = false
    @Published var pegel: String?
    
    var waterService: WaterProtocol
    var stationService: StationProtocol
    var slipwayService: SlipwayProtocol
    var db: DataBase
    
    static let shared = DataStore(WaterService(), StationService(), SlipwayService(), AppData())
    
    init(_ waterService: WaterProtocol, _ stationService: StationProtocol, _ slipwayService: SlipwayProtocol, _ db: DataBase)  {
        self.waterService = waterService
        self.stationService = stationService
        self.slipwayService = slipwayService
        self.db = db
        
        stations = [Station]()
        slipways = [Slipway]()
        waters = [Water]()
        userSettings = [SlipwayDb]()
    }
    
    func getStations() -> [Station] {
        if(stations.count == 0){
            stationService.fetchData(link: Links().stations) { (stations) in
                self.stations = stations
            }
        }
        return stations
    }
    
    func getPegel(id: String) {
        let s = HttpService<CurrentMeasurementResponse>()
        s.fetchSingleData(link: Links().pegel(station: id)) { (respone) in
            if let safe = respone{
                self.pegel = safe.pegel
            }
        }
    }
    
    func getSlipways() -> [Slipway] {
        if(slipways.count == 0){
            slipwayService.fetchData(link: Links().slipways) { (slipways) in
                let updatedSlipways = slipways.map { (slipway) -> Slipway in
                    var tmpSlipway = slipway
                    let userData = self.db.getSlipwayById(id: slipway.id)
                    if let saveUserData = userData{
                        tmpSlipway.isFavorite = saveUserData.isFavorite
                    }
                    return tmpSlipway
                }
                DispatchQueue.main.async {
                    self.slipways = updatedSlipways
                }
            }
        }
        return slipways
    }
    
    func getWater(id: String) -> Water?{
        if(waters.count == 0){
            waterService.fetchData(link: Links().waters) { (waters) in
                self.waters = waters
            }
        }
        return self.waters.first(where: { $0.id == id})
    }
    
    func getWaters() -> [Water] {
        if(waters.count == 0){
            waterService.fetchData(link: Links().waters) { (waters) in
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
            waterService
                .fetchData(link: Links().waters) { (waters) in
                    self.waters = waters
                    completion(waters)
            }
        }
        completion(waters)
    }
}
