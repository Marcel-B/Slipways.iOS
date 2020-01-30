//
//  Protocols.swift
//  Slipways
//
//  Created by Marcel Benders on 28.01.20.
//  Copyright © 2020 Marcel Benders. All rights reserved.
//

import Foundation
import MapKit

protocol Named {
    var name: String? { get set }
}

protocol Mapable {
    var longitude: Double { get set }
    var latitude: Double { get set }
    func locationCoordinate() -> CLLocationCoordinate2D
    func locationCoordinates() -> [CLLocationCoordinate2D]
}

protocol Locateable: Named, Mapable {
    var city: String? { get set }
    var postalcode: String? { get set }
    var street: String? { get set }
}
    
protocol Contactable: Locateable {
    var email: String? { get set }
    var url: URL? { get set }
    var phone: String? { get set }
}
