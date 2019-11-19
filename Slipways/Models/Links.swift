//
//  Links.swift
//  Slipways
//
//  Created by Marcel Benders on 17.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import Foundation

struct Links{
    let waters = "https://www.pegelonline.wsv.de/webservices/rest-api/v2/waters.json"
    let stations = "https://slipways.de/api/station"
    func pegel(station: String) -> String{
        "https://www.pegelonline.wsv.de/webservices/rest-api/v2/stations/\(station)/W.json?includeCurrentMeasurement=true"
    }
}
