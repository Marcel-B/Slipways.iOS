//
//  PegelService.swift
//  Slipways
//
//  Created by Marcel Benders on 29.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import Foundation
import os.log

protocol PegelData{
    func getPegel(data: Data, completion: @escaping (_ result: CurrentMeasurementResponse?) -> Void)
}

class Pegel: PegelData{
    let serializer: ObjectParser
    
    init(serializer: ObjectParser?){
        self.serializer = serializer ?? Serializer()
    }
    
    func getPegel(data: Data, completion: (CurrentMeasurementResponse?) -> Void) {
        let result: CurrentMeasurementResponse? = serializer.parseObject(data: data)
        completion(result)
    }
}

protocol PegelServiceProtocol{
    func getPegel(station: String, completion: @escaping (_ result: Data?) -> Void)
}

class PegelService : PegelServiceProtocol {
    func getPegel(station: String, completion: @escaping (Data?) -> Void) {
        if let url = URL(string: Link.pegel(station: station)){
            let urlSession = URLSession(configuration: .default)
            let task = urlSession.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    // TODO - report error
                    return
                }
                completion(data)
            }
            task.resume()
        }
    }
}
