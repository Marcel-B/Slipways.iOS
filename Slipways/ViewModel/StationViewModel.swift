//
//  StationViewModel.swift
//  Slipways
//
//  Created by Marcel Benders on 29.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import Foundation


class StationViewModel: ObservableObject{
    @Published var stations = [Station]()
    @Published var pegel: String?
    var stationService: StationProtocol

    let pegelService: PegelServiceProtocol
    let dataService: ObjectParser
    
    init(_ pegelService: PegelServiceProtocol?, _ dataService: ObjectParser?, _ stationService: StationProtocol?){
        self.pegelService = pegelService ?? PegelService()
        self.dataService = dataService ?? Serializer()
        self.stationService = stationService ?? StationService()
    }
    
    func getStations()-> [Station] {
        stationService.fetchData(link: Link.stations) { (stations) in
            self.stations = stations
        }
        return self.stations
    }
    
    func pegel(id: String, completion: @escaping (_ result: Double) -> Void) {
        pegelService.getPegel(station: id) { (data) in
            if let safeData = data{
                let response: CurrentMeasurementResponse? = self.dataService.parseObject(data: safeData)
                if let safeResponse = response{
                    DispatchQueue.main.async {
                        let v = String(format: "%.2f", safeResponse.currentMeasurement.value)
                        let b = String(format: "%.2f", safeResponse.gaugeZero.value)
                        self.pegel = "\(v)\(safeResponse.unit)/\(b)\(safeResponse.gaugeZero.unit)"
                    }
                    completion(safeResponse.currentMeasurement.value)
                }
            }
        }
    }
}
