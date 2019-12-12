//
//  Serializer.swift
//  Slipways
//
//  Created by Marcel Benders on 01.12.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import Foundation
import os.log

class Serializer: ObjectParser{
    func parseObject<T: Codable>(data: Data) -> T? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(T.self, from: data)
            return decodedData
        }catch{
            print(error)
            os_log("[Serializer] - Error while parsing single element.", log: OSLog.default, type: .error)
            return nil
        }
    }
}
