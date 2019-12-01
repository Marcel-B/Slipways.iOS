//
//  Station.swift
//  Slipways
//
//  Created by Marcel Benders on 18.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import Foundation

struct Station : Codable, Identifiable{
    let id: String
    let number: String
    let shortname: String
    let longname: String
    let km: Double
    let agency: String
    let longitude: Double
    let latitude: Double
    let waterFk: String
    
    let water: Water
    
    var fAgency: String {
        get{
            agency.capitalizingAllFirstLetters()
        }
    }
    
    var name: String {
        get{
            longname.capitalizingAllFirstLetters()
        }
    }
}
