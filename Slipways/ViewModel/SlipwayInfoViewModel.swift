//
//  SlipwayInfoViewModel.swift
//  Slipways
//
//  Created by Marcel Benders on 30.01.20.
//  Copyright © 2020 Marcel Benders. All rights reserved.
//

import Foundation

class SlipwayInfoViewModel{
    let slipway: Slipway
    
    init(_ slipway: Slipway){
        self.slipway = slipway
    }
    
    var costs: String {
        get {
            if Int(truncating: slipway.costs!) > 0{
                return "\(slipway.costs!.stringValue) €"
            }
            else if slipway.costs == 0{
                return "free"
            }
            return "not reported"
        }
    }
    
    var street: String {
        get {
            if let street = slipway.street {
                return street
            }
            return String.Empty
        }
    }
    
    var city: String {
        get{
            if let c = slipway.city {
                return c
            }
            return String.Empty
        }
    }
    
    var water: String {
        get {
            if let water = slipway.water {
                if let name = water.name {
                    return name
                }
            }
            return String.Empty
        }
    }
    
    var postalcode: String {
        get {
            if let p = slipway.postalcode {
                return p
            }
            return String.Empty
        }
    }
}
