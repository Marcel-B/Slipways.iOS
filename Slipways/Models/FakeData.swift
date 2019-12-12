//
//  FakeData.swift
//  Slipways
//
//  Created by Marcel Benders on 25.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import Foundation

struct FakeData{
    let slipway = SlipwayQl(id: "1", name: "Kettwig", postalcode: "47111", street: "Fuchsbaustr. 22",  city: "Essen", longitude: 2.2, latitude: 2.2, costs: 1.2, extras: [ExtraQl](), water: WaterQl(id: "2", longname: "Ruhr", stations: [StationQl]())  )

    let station = StationQl(id: "1", longname: "foobar", agency: "hello", number: "123",  latitude: 2.2,  longitude: 2.2)
    
    let water = WaterQl(id: "123-123", longname: "RUHR", stations: [StationQl]())
}
