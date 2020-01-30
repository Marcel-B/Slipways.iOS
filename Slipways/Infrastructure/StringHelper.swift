//
//  StringHelper.swift
//  Slipways
//
//  Created by Marcel Benders on 30.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import Foundation

extension String {
    static var Empty: String {
        get {
            return "-"
        }
    }
    
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    func capitalizingAllFirstLetters() -> String{
        let f = formatBySeparator(water: self.lowercased(), separator: "-")
        return formatBySeparator(water: f, separator: " ")
    }
    
    func formatBySeparator(water: String, separator: String) -> String{
        let words = water.split(separator: separator.first!)
        let pWords = words.map { (word) -> String in
            let lowerWord = String(word)
            return lowerWord.capitalizingFirstLetter()
        }
        return pWords.joined(separator: separator)
    }
}
