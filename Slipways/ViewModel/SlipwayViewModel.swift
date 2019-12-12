//
//  SlipwayViewModel.swift
//  Slipways
//
//  Created by Marcel Benders on 29.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import Foundation

class SlipwayViewModel{
    let appData: InternDataStore
    
    init(_ appData: InternDataStore = AppData.shared){
        self.appData = appData
    }
    
    func hasFavorites() -> Bool {
        let slipways = appData
            .getSlipways()
            .filter { (slipwayDb) -> Bool in
                slipwayDb.isFavorite
        }
        return slipways.count > 0
    }
    
    func getSlipways() -> [SlipwayQl]{
        let dataStore = DataStore.shared
        return dataStore.data.slipways
    }
    
    func hasCampingSite(with slipway: SlipwayQl) -> Bool {
        slipway.extras.contains { (extra) -> Bool in
            extra.name == "Campingplatz"
        }
    }
}
