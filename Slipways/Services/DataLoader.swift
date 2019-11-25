//
//  DataLoader.swift
//  Slipways
//
//  Created by Marcel Benders on 31.10.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//
import SwiftUI
import RealmSwift
import os.log

protocol DataBase{
    func getSlipways() -> [SlipwayDb]
    func getSlipwayById(id: String) -> SlipwayDb?
    func updateSlipway(id: String, value: Bool)
}

class RealmBase: DataBase{
    
    let realm = try! Realm(configuration: RealmConfig().config)
    
    func updateSlipway(id: String, value: Bool) {
        do{
            let sli = getSlipwayById(id: id)
            if let slip = sli{
                try realm.write {
                    slip.isFavorite = value
                }
            }
        }catch{
            print("Error while update element")
            print(error)
            os_log("Error while update element.", log: OSLog.default, type: .error)
}
    }
    
    func getSlipways() -> [SlipwayDb]{
        try! Array(Realm().objects(SlipwayDb.self))
    }
    
    func getSlipwayById(id: String) -> SlipwayDb?{
        var slip = realm.objects(SlipwayDb.self).filter("id == '\(id)'").first
        // Create slipway if not exists
        if(slip == nil){
            slip = SlipwayDb()
            slip?.id = id
            try! realm.write {
                realm.add(slip!)
            }
            return getSlipwayById(id: id)
        }
        return slip
    }
}
