//
//  PortRowViewModel.swift
//  Slipways
//
//  Created by Marcel Benders on 30.01.20.
//  Copyright © 2020 Marcel Benders. All rights reserved.
//

import Foundation

class PortRowViewModel {
    let port: Port
    
    init(_ port: Port){
        self.port = port
    }
    
    var name: String {
        get {
            if let value = port.name {
                return value
            }
            return String.Empty
        }
    }
    
    var city: String {
        get {
            if let value = port.city {
                return value
            }
            return String.Empty
        }
    }
    
    var water: String {
        get {
            if let water = port.water {
                if let value = water.name {
                    return value
                }
            }
            return String.Empty
        }
    }
}
