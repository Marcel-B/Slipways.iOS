//
//  FakeData.swift
//  Slipways
//
//  Created by Marcel Benders on 25.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import Foundation

struct FakeData{
//    static let slipway = SlipwayQl(id: "1", lastUpdate: nil, name: "Kettwig", postalcode: "47111", street: "Fuchsbaustr. 22",  city: "Essen", longitude: 2.2, latitude: 2.2, costs: 1.2, port: nil, extras: [ExtraQl](), water: water , rating: 1, isFavorite: true )
    
    static let station = StationQl(id: "1", longname: "foobar", agency: "hello", number: "123",  latitude: 2.2,  longitude: 2.2, water: water)
    
    static let water = WaterQl(id: "123-123", longname: "RUHR")
    
    static let service = ServiceQl(id: "123-123", name: "Meyer Motoren", longitude: 2.2, latitude: 1.1, phone: "0020-3342 242", url: "https://foo.de", street: "Musterstr. 111", postalcode: "47800", city: "Krefeld", email: "Mopa@foo.de", manufacturers: manufacturers)
    
    static let manufacturers = [ManufacturerQl(id: "123", name: "Yamaha"), ManufacturerQl(id: "234", name: "Mercury")]
}
