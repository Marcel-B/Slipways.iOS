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
    var id: String
    var name: String
    var street: String?
    var waterFk: String
    var rating: Int
    var comment: String?
    var postalcode: String?
    var city: String?
    var costs: Decimal
    var pro: String?
    var contra: String?
    var isFavorite: Bool?
    var latitude: Double
    var longitude: Double
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D (
            latitude: latitude, longitude: longitude)
    }
}
