//
//  DataLoader.swift
//  Slipways
//
//  Created by Marcel Benders on 31.10.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//
import SwiftUI
import RealmSwift

var slipwaysData: [Slipway] = load(filename: "slipways.json")

func load(filename: String) -> [Slipway] {
    let data:  Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else{
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do{
        data = try Data(contentsOf: file)
    }catch{
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do{
        let decoder =  JSONDecoder()
        var values = try decoder.decode([Slipway].self, from: data)
        let realm = try! Realm()
        let savedData = realm.objects(SlipwayDb.self)
        
        savedData.forEach { userSetting in
            let entity = values.first(where: { $0.id == userSetting.id })
            if let row = values.firstIndex(where: {$0.id == userSetting.id}) {
                if var slipway = entity{
                    slipway.isFavorite = userSetting.isFavorite
                    values[row] = slipway
                }
            }
        }
        return values
        
    } catch{
        fatalError("Couldn't parse \(filename) as \([Slipway].self):\n\(error)")
    }
}
