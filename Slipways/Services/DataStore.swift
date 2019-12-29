//
//  DataStore.swift
//  Slipways
//
//  Created by Marcel Benders on 21.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import Foundation

final class DataStore: ObservableObject{
    @Published var userSettings: [SlipwayDb]
    @Published var showFavoritesOnly: Bool = false
    @Published var data: DataQl
        
    static let shared = DataStore()
    
    init()  {
//        stations = [Station]()
        userSettings = [SlipwayDb]()
        data = DataQl(slipways: [SlipwayQl](), waters: [WaterQl](), services: [ServiceQl]())
    }
}
