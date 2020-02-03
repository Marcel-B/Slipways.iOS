//
//  PortExtensions.swift
//  Slipways
//
//  Created by Marcel Benders on 29.01.20.
//  Copyright © 2020 Marcel Benders. All rights reserved.
//

import Foundation
import MapKit

extension Port: Contactable, Identifiable{

    func locationCoordinate() -> CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    func locationCoordinates() -> [CLLocationCoordinate2D] {
        var locationCoordinates = [CLLocationCoordinate2D]()
        locationCoordinates.append(locationCoordinate())
        if let slipwaySet = slipway{
            let slipways = slipwaySet.allObjects as! [Slipway]
            for slipway in slipways {
                locationCoordinates.append(slipway.locationCoordinate())
            }
        }
        return locationCoordinates
    }
    
}
