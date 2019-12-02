//
//  WaterViewModel.swift
//  Slipways
//
//  Created by Marcel Benders on 30.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import Foundation

class WaterViewModel{
    
    var waterService: WaterProtocol
    let serializer: ObjectParser
    
    static let shared = WaterViewModel(WaterService(), Serializer())
    
    init(_ waterService: WaterProtocol = WaterService(), _ serializer: ObjectParser = Serializer()){
        self.waterService = waterService
        self.serializer = serializer
    }
    
    func getWaters(filter: String) -> [Water] {
        getWaters()
            .filter { (water) -> Bool in
                water.longname.lowercased().starts(with: filter.lowercased())
        }
    }
    
    func getWater(id: String) -> Water?{
        DataStore.shared.waters.first(where: { $0.id == id})
    }
    
    func getWaters() -> [Water] {
        let data = DataStore.shared
        if data.waters.count == 0{
            waterService.getWaters { (waters, error) in
                if error != nil{
                    debugPrint("Sorry, an error occurred")
                }else{
                    
                    if let safeWaters = waters{
                        DispatchQueue.main.async {
                            data.waters = safeWaters
                        }
                    }
                }
            }
        }
        return data.waters
    }
    
    static func formatName(water: String) -> String{
        let f = formatBySeparator(water: water.lowercased(), separator: "-")
        return formatBySeparator(water: f, separator: " ")
    }
    
    static func formatBySeparator(water: String, separator: String) -> String{
        let words = water.split(separator: separator.first!)
        let pWords = words.map { (word) -> String in
            let lowerWord = String(word)
            return lowerWord.capitalizingFirstLetter()
        }
        return pWords.joined(separator: separator)
    }
}
