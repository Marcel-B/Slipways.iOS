//
//  Queries.swift
//  Slipways
//
//  Created by Marcel Benders on 13.01.20.
//  Copyright © 2020 Marcel Benders. All rights reserved.
//

import Foundation

struct Query{
    static let AppData = "{\"query\": \"{ appData { extras { id name updated } manufacturers { id name updated } services { id name street city postalcode phone longitude latitude updated email url manufacturers { id name updated } } ports { id name longitude latitude updated street postalcode city url phone email water { id longname updated } } slipways { id name street city postalcode costs longitude latitude country rating port { id name longitude latitude updated } water { id longname updated } extras { id name updated } } waters { id longname stations { id agency number longname longitude latitude } } stations { id agency number updated longname longitude latitude water { id longname}}}} \"}"
   
    static let Extras = "{\"query\": \"{ extras { id name updated } } \"}"
    static let Ports = "{\"query\":  \"{ ports  { id name longitude latitude updated street postalcode city url phone email } }\"}"
    static let Stations = "{\"query\": \"{ stations { id agency number longname longitude latitude water { id longname } } }\"}"
    static let Manufacturers = "{\"query\": \"{ manufacturers { id name updated } } \"}"
    static let Waters = "{\"query\": \"{ waters { id longname stations { id agency number longname longitude latitude } } }\"}"
    static let Slipways = "{\"query\": \"{ slipways { id name street city postalcode costs longitude latitude rating port { id name longitude latitude updated } water { id longname } extras { id name } } }\" }"
    static let Services = "{\"query\": \"{ services { id name street city postalcode phone longitude latitude email url manufacturers { id name } } } \"}"
}
