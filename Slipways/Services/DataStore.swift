//
//  DataStore.swift
//  Slipways
//
//  Created by Marcel Benders on 21.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import Foundation

final class DataStore: ObservableObject{
    @Published var stations: [Station]
    @Published var slipways: [Slipway]
    @Published var waters: [Water]
    @Published var userSettings: [SlipwayDb]
    @Published var showFavoritesOnly: Bool = false
    
    var token: Token?
    
    static let shared = DataStore()
    
    init()  {
        stations = [Station]()
        slipways = [Slipway]()
        waters = [Water]()
        userSettings = [SlipwayDb]()
    }

//    func getStationsByExpression(exp: (_ isIncluded: Station) -> Bool) -> [Station]{
//        getStations()
//            .filter(exp)
//    }
}
