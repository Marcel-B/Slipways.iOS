//
//  FakeData.swift
//  Slipways
//
//  Created by Marcel Benders on 25.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import Foundation

struct FakeData{
    let slipway = Slipway(id: "123", name: "Kettwig", street: "Alte Fähre 2", waterFk: "123", rating: 1, comment: "sef", postalcode: "1234", city: "Essen", costs: 1.1, pro: "sdf", contra: "sf", isFavorite: false, latitude: 2.2, longitude: 2.2)
    
    let station = Station(id: "1", number: "123", shortname: "foo", longname: "foobar", km: 2.22, agency: "hello", longitude: 2.2, latitude: 2.2, waterFk: "0815", water: Water(id: "kk", shortname: "foo", longname: "foobar"))
    
    let water = Water(id: "123-123", shortname: "RUHR", longname: "RUHR")
}
