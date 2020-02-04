//
//  Slipway.swift
//  Slipways
//
//  Created by Marcel Benders on 31.10.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI
import CoreLocation

struct FetchResult: Codable{
    var data: DataDataQl
}

struct DataDataQl: Codable{
    var appData: AppDataQl
}

struct AppDataQl: Codable{
    init(){
        slipways = [SlipwayQl]()
        ports = [PortQl]()
        waters = [WaterQl]()
        stations = [StationQl]()
        services = [ServiceQl]()
        extras = [ExtraQl]()
        manufacturers = [ManufacturerQl]()
    }
    
    var slipways: [SlipwayQl]
    var ports: [PortQl]
    var waters: [WaterQl]
    var stations: [StationQl]
    var services: [ServiceQl]
    var extras: [ExtraQl]
    var manufacturers: [ManufacturerQl]
}

struct DataQl: Codable{
    var slipways: [SlipwayQl]
    var waters: [WaterQl]
    var services: [ServiceQl]
}

struct ServiceQl: Codable, Identifiable{
    var id: String
    var name: String
    var longitude: Double
    var latitude: Double
    var phone: String?
    var url: String?
    var street: String
    var postalcode: String
    var updated: Date?
    var city: String
    var email: String?
    var manufacturers: [ManufacturerQl]?
    
    var manufacturersList: [ManufacturerQl] {
        get{
            manufacturers ?? [ManufacturerQl]()
        }
    }
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D (
            latitude: latitude, longitude: longitude)
    }
    var uuid: UUID{
        get{
            UUID(uuidString: id)!
        }
    }
}

struct ManufacturerQl: Codable, Identifiable{
    var id: String
    var name: String
    var updated: Date?
    var uuid: UUID{
        get{
            UUID(uuidString: id)!
        }
    }
}

struct ExtraQl: Codable{
    var name: String
    var id: String
    var updated: Date?
    var uuid: UUID{
        get{
            UUID(uuidString: id)!
        }
    }
}

struct StationQl: Codable, Identifiable{
    
    var id: String
    var longname: String
    var agency: String
    var number: String
    var latitude: Double
    var longitude: Double
    var water: WaterQl?
    var updated: Date?
    
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
    
    var uuid: UUID{
        get{
            UUID(uuidString: id)!
        }
    }
}

struct WaterQl: Codable, Identifiable {
    
    var id: String
    var longname: String
    var updated: Date?
    
    var name: String{
        get{
            longname.capitalizingAllFirstLetters()
        }
    }
    
    var uuid: UUID{
        get{
            UUID(uuidString: id)!
        }
    }
}

struct PortQl: Codable, Identifiable{
    
    var id: String
    var name: String
    var street: String?
    var postalcode: String?
    var city: String?
    var url: String?
    var email: String?
    var phone: String?
    var updated: Date?
    var longitude: Double
    var latitude: Double
    var water: WaterQl?
    
    var uuid: UUID{
        get{
            UUID(uuidString: id)!
        }
    }
}

struct SlipwayQl: Codable, Identifiable{
    
    var id: String
    var updated: Date?
    var name: String
    var postalcode: String
    var street: String
    var city: String
    var longitude: Double
    var latitude: Double
    var costs: Decimal
    var port: PortQl?
    var extras: [ExtraQl]
    var water: WaterQl
    var rating: Int?
    var country: String?
    
    var isFavorite: Bool?
    
    var favorite: Bool {
        get {
            isFavorite ?? false
        }
    }
    
    var uuid: UUID{
        get{
            UUID(uuidString: id)!
        }
    }
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D (
            latitude: latitude, longitude: longitude)
    }
}
