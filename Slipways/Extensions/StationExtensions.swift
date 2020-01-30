//
//  StationExtensions.swift
//  Slipways
//
//  Created by Marcel Benders on 24.01.20.
//  Copyright © 2020 Marcel Benders. All rights reserved.
//

import Foundation
import MapKit

extension Station: Mapable {
    func fromStationQl(_ ql: StationQl) {
        self.name = ql.name
        self.lastUpdate = ql.updated
        self.agency = ql.agency
        self.latitude = ql.latitude
        self.longitude = ql.longitude
        self.number = ql.number
    }
    func locationCoordinate() -> CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    func locationCoordinates() -> [CLLocationCoordinate2D] {
        [locationCoordinate()]
    }
}
