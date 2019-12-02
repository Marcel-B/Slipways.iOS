//
//  WaterService.swift
//  Slipways
//
//  Created by Marcel Benders on 02.12.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import Foundation

protocol WaterProtocol {
    func getWaters(completion: @escaping (_ data: [Water]?, _ error: Error?) -> Void)
}

class WaterService: WaterProtocol{
    
    let webService: WebService
    let serializer: ObjectParser
    
    init(_ webService: WebService = WebService(), _ serializer: ObjectParser = Serializer()){
        self.webService = webService
        self.serializer = serializer
    }
    
    func getWaters(completion: @escaping (_ data: [Water]?, _ error:  Error?) -> Void) {
        let dataStore = DataStore.shared
        debugPrint("Fetch water from \(Link.waters)")
        self.webService.fetchSecuredData(link: Link.waters, token: dataStore.token!.accessToken) { (data, error) in
            if error != nil{
                completion(nil, error)
            }
            else{
                if let safeData = data{
                    let waters: [Water]? = self.serializer.parseObject(data: safeData)
                    completion(waters, nil)
                }
            }
        }
    }
}
