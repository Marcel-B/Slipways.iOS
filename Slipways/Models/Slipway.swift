//
//  Slipway.swift
//  Slipways
//
//  Created by Marcel Benders on 31.10.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI
import CoreLocation

struct Slipway: Identifiable, Codable, Hashable {
    var id: Int
    var name: String
    var street: String
    var water: String
    var rating: Int
    var comment: String
    var postalcode: String
    var city: String
    var costs: Decimal
    var pro: String
    var contra: String
    var isFavorite: Bool
    
    fileprivate var coordinates: Coordinates
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D (
            latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
}
