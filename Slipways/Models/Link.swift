//
//  Links.swift
//  Slipways
//
//  Created by Marcel Benders on 17.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import Foundation

struct Link{
    static let waters = "https://slipways.de/api/water"
    static let stations = "https://slipways.de/api/station"
    static let slipways = "https://slipways.de/api/slipway"

    static func pegel(station: String) -> String{
        "https://www.pegelonline.wsv.de/webservices/rest-api/v2/stations/\(station)/W.json?includeCurrentMeasurement=true"
    }
}
