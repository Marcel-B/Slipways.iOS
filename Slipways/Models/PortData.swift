//
//  PortData.swift
//  Slipways
//
//  Created by Marcel Benders on 22.01.20.
//  Copyright © 2020 Marcel Benders. All rights reserved.
//

import Foundation

struct DataPortQl: Codable {
    var ports: [PortQl]
}

struct ImportPortData: Codable {
    var data: DataPortQl
}

