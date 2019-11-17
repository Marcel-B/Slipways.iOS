//
//  Water.swift
//  Slipways
//
//  Created by Marcel Benders on 17.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import Foundation

struct Water: Codable, Identifiable{
    let id = UUID()
    let shortname: String
    let longname: String
}
