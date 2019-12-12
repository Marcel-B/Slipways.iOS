//
//  Slipway.swift
//  Slipways
//
//  Created by Marcel Benders on 31.10.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI
import CoreLocation

struct ImportData: Codable{
    var data: DataQl
}

struct DataQl: Codable{
    var slipways: [SlipwayQl]
    var waters: [WaterQl]
}

struct ExtraQl: Codable{
    var name: String
}

struct StationQl: Codable, Identifiable{
    var id: String
    var longname: String
    var agency: String
    var number: String
    var latitude: Double
    var longitude: Double
    
    var fAgency: String {
         get{
             agency.capitalizingAllFirstLetters()
         }
     }
     
     var name: String {
         get{
             longname.capitalizingAllFirstLetters()
         }
     }
}

struct WaterQl: Codable, Identifiable {
    var id: String
    var longname: String
    var stations: [StationQl]?
    var name: String{
        get{
            longname.capitalizingAllFirstLetters()
        }
    }
}

struct SlipwayQl: Codable, Identifiable{
    var id: String
    var name: String
    var postalcode: String
    var street: String
    var city: String
    var longitude: Double
    var latitude: Double
    var costs: Decimal
    var extras: [ExtraQl]
    var water: WaterQl
    var isFavorite: Bool?
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D (
            latitude: latitude, longitude: longitude)
    }
}
