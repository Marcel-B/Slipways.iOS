//
//  StationViewModel.swift
//  Slipways
//
//  Created by Marcel Benders on 29.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import Foundation
import os.log
import MapKit

class StationViewModel{
    let pegelService: PegelProtocol
    let serializer: ObjectParser
    let station: Station
    
    var locationCoordinates: [CLLocationCoordinate2D] {
        get {
            station.locationCoordinates()
        }
    }
    
    var name: String {
        get{
            if let n = station.name{
                return n
            }
            return String.Empty
        }
    }
    
    init(_ station: Station, _ pegelService: PegelProtocol = PegelService(), _ dataService: ObjectParser = Serializer()){
        self.pegelService = pegelService
        self.serializer = dataService
        self.station = station
    }
}
