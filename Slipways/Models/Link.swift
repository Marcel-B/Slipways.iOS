//
//  Links.swift
//  Slipways
//
//  Created by Marcel Benders on 17.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import Foundation

struct Link{
    static let graphQL = "https://data.slipways.de/graphql"

    static func pegel(station: String) -> String{
        "https://www.pegelonline.wsv.de/webservices/rest-api/v2/stations/\(station)/W.json?includeCurrentMeasurement=true"
    }
}
