//
//  DataBase.swift
//  Slipways
//
//  Created by Marcel Benders on 25.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import Foundation

protocol InternDataStore{
    func getSlipways() -> [SlipwayDb]
    func getSlipwayById(id: String) -> SlipwayDb?
    func updateSlipway(id: String, value: Bool)
}
