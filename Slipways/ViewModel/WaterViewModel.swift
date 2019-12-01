//
//  WaterViewModel.swift
//  Slipways
//
//  Created by Marcel Benders on 30.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import Foundation

class WaterViewModel{
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
