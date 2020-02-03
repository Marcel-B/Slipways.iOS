//
//  WaterExtensions.swift
//  Slipways
//
//  Created by Marcel Benders on 24.01.20.
//  Copyright © 2020 Marcel Benders. All rights reserved.
//

import Foundation

extension Water {
    func fromWaterQl(_ ql: WaterQl) {
        self.name = ql.name
        self.lastUpdate = ql.updated
    }
}
