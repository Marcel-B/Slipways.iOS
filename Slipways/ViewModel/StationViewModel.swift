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
                let p: CurrentMeasurementResponse? = self.dataService.parseObject(data: safeData)
                if let safeP = p{
                    DispatchQueue.main.async {
                        self.pegel = "\(safeP.currentMeasurement.value)\(safeP.unit)/\(safeP.gaugeZero.value)\(safeP.gaugeZero.unit)"
                    }
                    completion(safeP.currentMeasurement.value)
                }
            }
        }
    }
}
