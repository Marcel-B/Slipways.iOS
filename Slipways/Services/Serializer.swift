//
//  Serializer.swift
//  Slipways
//
//  Created by Marcel Benders on 28.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import Foundation
import os.log

class Serializer{
    static func parseSingle<T: Codable>(data: Data) -> T? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(T.self, from: data)
            return decodedData
        }catch{
            os_log("Error while parsing single element.", log: OSLog.default, type: .error)
            return nil
        }
    }
    
    static func parse<T: Codable>(data: Data) -> [T]? {
        let decoder = JSONDecoder()
        do{
            if data.count > 0{
                let decodedData = try decoder.decode([T].self, from: data)
                return decodedData
            }
            return nil
        }catch{
            os_log("Error while parsing element.", log: OSLog.default, type: .error)
            return nil
        }
    }
}
