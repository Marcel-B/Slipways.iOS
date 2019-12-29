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
    
    func getCosts(slipway: SlipwayQl) -> String {
        if slipway.costs > 0{
            return "\(NSDecimalNumber(decimal: slipway.costs).stringValue) €"
        }
        else if slipway.costs == 0{
            return "kostenlos"
        }
        return "keine Angaben"
    }
}
