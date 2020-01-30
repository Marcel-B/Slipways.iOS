//
//  StationInfoViewModel.swift
//  Slipways
//
//  Created by Marcel Benders on 30.01.20.
//  Copyright © 2020 Marcel Benders. All rights reserved.
//

import Foundation

class StationInfoViewModel: ObservableObject{
    let station: Station
    
    @Published var pegel: String

    let pegelService: PegelProtocol
    let serializer: ObjectParser
    
    init(_ station: Station, _ pegelService: PegelProtocol = PegelService(), _ dataService: ObjectParser = Serializer()){
        self.pegelService = pegelService
        self.serializer = dataService
        self.station = station
        self.pegel = String.Empty
    }
    
    var name: String {
        get{
            if let n = station.name{
                return n
            }
            return String.Empty
        }
    }
    
    var water: String {
        get {
            if let w = station.water{
                if let name = w.name {
                    return name
                }
            }
            return String.Empty
        }
    }
    
    var number: String {
        get{
            if let n = station.number{
                return n
            }
            return String.Empty
        }
    }
    
    var agency: String {
        get{
            if let a = station.agency {
                return a
            }
            return String.Empty
        }
    }
    
    func pegel(completion: @escaping (_ result: Double) -> Void) {
        pegelService.getPegel(station: "\(self.station.id!)") { (data) in
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
