//
//  StationExtensions.swift
//  Slipways
//
//  Created by Marcel Benders on 24.01.20.
//  Copyright © 2020 Marcel Benders. All rights reserved.
//

import Foundation

extension Station {
    func fromStationQl(_ ql: StationQl) {
        self.name = ql.name
        self.lastUpdate = ql.updated
        self.agency = ql.agency
        self.latitude = ql.latitude
        self.longitude = ql.longitude
        self.number = ql.number
    }
}
