//
//  StationService.swift
//  Slipways
//
//  Created by Marcel Benders on 02.12.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import Foundation

protocol StationProtocol {
    func getStations(completion: @escaping (_ data: [Station]?, _ error: Error?) -> Void)
}

class StationService:  StationProtocol{
    
    let webService: WebService
    let serializer: ObjectParser
    let dataStore = DataStore.shared
    
    init(_ webService: WebService = WebService(), _ serializer: ObjectParser = Serializer()){
        self.webService = webService
        self.serializer = serializer
    }
    
    func getStations(completion: @escaping (_ data: [Station]?, _ error: Error?) -> Void){
        let dataStore = DataStore.shared
        debugPrint("Fetch station from \(Link.stations)")
        self.webService.fetchSecuredData(link: Link.stations, token: dataStore.token!.accessToken) { (data, error) in
            if error != nil{
                completion(nil, error)
            }
            else{
                if let safeData = data{
                    let stations: [Station]? = self.serializer.parseObject(data: safeData)
                    completion(stations, nil)
                }
            }
        }
    }
}
