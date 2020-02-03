//
//  ServiceExtensions.swift
//  Slipways
//
//  Created by Marcel Benders on 23.01.20.
//  Copyright © 2020 Marcel Benders. All rights reserved.
//

import Foundation
import MapKit
extension Service: Contactable, Identifiable {
  
    // new functionality to add to SomeType goes here
    func fromServiceQl(_ ql: ServiceQl) {
        self.name = ql.name
        self.city = ql.city
        self.street = ql.street
        self.postalcode = ql.postalcode
        self.email = ql.email
        self.phone = ql.phone
        self.lastUpdate = ql.updated
        self.latitude = ql.latitude
        self.longitude = ql.longitude
        self.lastUpdate = ql.updated
        
        // TODO: - Check Manufacturers Update
        
        if let urlString = ql.url{
            if let url = URL(string: urlString){
                self.url = url
            }
        }
    }
    
    func locationCoordinate() -> CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    func locationCoordinates() -> [CLLocationCoordinate2D] {
        [locationCoordinate()]
    }
    
}
