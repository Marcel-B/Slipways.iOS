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
    
    let pegelService: PegelServiceProtocol
    let dataService: SerializerBoh
    
    init(_ pegelService: PegelServiceProtocol?, _ dataService: SerializerBoh?){
        self.pegelService = pegelService ?? PegelService()
        self.dataService = dataService ?? SerializerBah()
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
