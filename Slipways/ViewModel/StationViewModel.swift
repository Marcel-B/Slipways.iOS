//
//  StationViewModel.swift
//  Slipways
//
//  Created by Marcel Benders on 29.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import Foundation
import os.log

class StationViewModel: ObservableObject{
    @Published var pegel: String?
    
    static let shared = StationViewModel(PegelService(), Serializer())
    
    let pegelService: PegelProtocol
    let serializer: ObjectParser
    
    init(_ pegelService: PegelProtocol = PegelService(), _ dataService: ObjectParser = Serializer()){
        self.pegelService = pegelService
        self.serializer = dataService
    }
    
//    func getStations(filter: String) -> [Station] {
//        let flt = filter.uppercased()
//        var st = [Station]()
//        let stations = getStations()
//        for station in stations{
//            if station.longname.starts(with: flt){
//                st.append(station)
//            }
//        }
//        return st
////        return getStations()
////            .filter { $0.longname.contains(flt) }
////            .filter { (station) -> Bool in
////                station.longname.lowercased().starts(with: filter.lowercased())
////        }
//    }
    
    func getStations() -> [StationQl] {
        let store = DataStore.shared
        var stations = [StationQl]()
        for water in store.data.waters{
            stations.append(contentsOf: water.stations!)
        }
        return stations
    }
    
    func pegel(id: String, completion: @escaping (_ result: Double) -> Void) {
        pegelService.getPegel(station: id) { (data) in
            if let safeData = data{
                let response: CurrentMeasurementResponse? = self.serializer.parseObject(data: safeData)
                if let safeResponse = response{
                    DispatchQueue.main.async {
                        let v = String(format: "%.2f", safeResponse.currentMeasurement.value)
                        let b = String(format: "%.2f", safeResponse.gaugeZero.value)
                        self.pegel = "\(v)\(safeResponse.unit) ~ \(b)\(safeResponse.gaugeZero.unit)"
                    }
                    completion(safeResponse.currentMeasurement.value)
                }
            }
        }
    }
}
