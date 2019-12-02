//
//  DataLoader.swift
//  Slipways
//
//  Created by Marcel Benders on 31.10.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//
import SwiftUI
import os.log

class AppData: DataBase{
    
    func updateSlipway(id: String, value: Bool) {
        let defaults = UserDefaults.standard
        let slipwayDb = SlipwayDb(id: id, isFavorite: value)
        // Use PropertyListEncoder to convert Player into Data / NSData
        defaults.set(try? PropertyListEncoder().encode(slipwayDb), forKey: id)
    }
    
    func getSlipways() -> [SlipwayDb]{
        return [SlipwayDb]()
    }
    
    func getSlipwayById(id: String) -> SlipwayDb?{
        let defaults = UserDefaults.standard
        guard let slipwayDbData = defaults.object(forKey: id) as? Data else {
            updateSlipway(id: id, value: false)
            _ = getSlipwayById(id: id)
            return nil
        }
        
        // Use PropertyListDecoder to convert Data into Player
        guard let slipwayDb = try? PropertyListDecoder().decode(SlipwayDb.self, from: slipwayDbData) else {
            return nil
        }
        return slipwayDb
    }
}
