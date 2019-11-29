//
//  Serializer.swift
//  Slipways
//
//  Created by Marcel Benders on 29.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import Foundation
import os.log

protocol SerializerBoh{
    func parseObject<T: Codable>(data: Data) -> T?
}

class SerializerBah: SerializerBoh{
    func parseObject<T: Codable>(data: Data) -> T? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(T.self, from: data)
            return decodedData
        }catch{
            os_log("Error while parsing single element.", log: OSLog.default, type: .error)
            return nil
        }
    }
}
