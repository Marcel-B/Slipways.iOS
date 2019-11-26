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


class RealmBase: DataBase{
    
    
    
    func updateSlipway(id: String, value: Bool) {
        do{
            let realm = try Realm(configuration: Realm.Configuration(schemaVersion: 3))
            let sli = getSlipwayById(id: id)
            if let slip = sli{
                try realm.write {
                    slip.isFavorite = value
                }
            }
        }catch{
            os_log("Error while update element.", log: OSLog.default, type: .error)
        }
    }
    
    func getSlipways() -> [SlipwayDb]{
        do{
            return try Array(Realm(configuration: Realm.Configuration(schemaVersion: 3)).objects(SlipwayDb.self))
        }catch{
            os_log("Error while fetching elements.", log: OSLog.default, type: .error)
            return [SlipwayDb]()
        }
    }
    
    func getSlipwayById(id: String) -> SlipwayDb?{
        do{
            let realm = try Realm(configuration: Realm.Configuration(schemaVersion: 3))
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
        }catch{
            os_log("Error while fetching element.", log: OSLog.default, type: .error)
            return nil
        }
    }
}
