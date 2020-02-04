//
//  SlipwayRowViewModel.swift
//  Slipways
//
//  Created by Marcel Benders on 31.01.20.
//  Copyright © 2020 Marcel Benders. All rights reserved.
//

import Foundation

class SlipwayRowViewModel: SlipwayInfoViewModel {
    var name: String {
        get{
            if let value = slipway.name{
                return value
            }
            return String.Empty
        }
    }
    
    var favorite: Bool {
        get {
            return slipway.favorite
        }
    }
    
    var rawCosts: NSDecimalNumber {
        get {
            if let value = slipway.costs{
                return value
            }
            return -1
        }
    }
    
    var camping: Bool {
        return getExtras().contains { $0.name == "Campingplatz" }
    }
    
    var parking: Bool {
        return getExtras().contains { $0.name == "Parkplatz" }
    }
    
    var pier: Bool {
        return getExtras().contains { $0.name == "Steg" }
    }
    
    var hasPort: Bool {
        slipway.port != nil
    }
    
    func getExtras() -> [Extra] {
        if let extras = slipway.extra{
            return extras.allObjects as! [Extra]
        }
        return [Extra]()
    }
    
    func getCountry() -> String {
        if let country = slipway.country {
            switch country {
                case "DE":
                return "germany54"
                case "NL":
                return "netherlands54"
                case "FR":
                return "france54"
                default:
                return ""
            }
        }
        return "europe54"
    }
}
