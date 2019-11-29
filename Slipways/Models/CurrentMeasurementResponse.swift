//
//  CurrentMeasurement.swift
//  Slipways
//
//  Created by Marcel Benders on 19.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import Foundation

struct CurrentMeasurement : Codable{
    let timestamp: String
    let value: Double
    let trend: Int
    let stateMnwMhw: String
    let stateNswHsw: String
}

struct GaugeZero: Codable{
    let unit: String
    let value: Double
    let validFrom: String
}

struct CurrentMeasurementResponse : Codable{
    let shortname: String
    let longname: String
    let unit: String
    let equidistance: Int
    let currentMeasurement: CurrentMeasurement
    let gaugeZero: GaugeZero
}

extension CurrentMeasurementResponse{
    var pegel: String {return  "\(String(format: "%.1f", currentMeasurement.value)) \(unit) / \(String(format: "%.1f", gaugeZero.value)) \(gaugeZero.unit)"}
}
