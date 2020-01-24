//
//  SlipwayExtensions.swift
//  Slipways
//
//  Created by Marcel Benders on 23.01.20.
//  Copyright © 2020 Marcel Benders. All rights reserved.
//

import Foundation

extension Slipway{
    func fromSlipwayQl(_ ql: SlipwayQl){
        self.lastUpdate = ql.updated
        self.longitude = ql.longitude
        self.city = ql.city
        self.costs = NSDecimalNumber(decimal: ql.costs)
        self.latitude = ql.latitude
        self.name = ql.name
        self.postalcode = ql.postalcode
        if let rating = ql.rating{
            self.rating = Int32(rating)
        }
        self.street = ql.street
        
        // TODO - Check Water
        // TODO - Check Extras
        // TODO - Check Port
    }
}

