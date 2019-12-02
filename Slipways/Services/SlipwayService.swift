//
//  SlipwayService.swift
//  Slipways
//
//  Created by Marcel Benders on 02.12.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import Foundation

protocol SlipwayProtocol{
    func getSlipways(completion: @escaping (_ data: [Slipway]?, _ error: Error?) -> Void )
}

class SlipwayService: SlipwayProtocol{
    
    let webService: WebService
    let serializer: ObjectParser
    let appData: DataBase
    
    init(_ webService: WebService = WebService(), _ serializer: ObjectParser = Serializer(), _ appData: DataBase = AppData()){
        self.webService = webService
        self.serializer = serializer
        self.appData = appData
    }
    
    func getSlipways(completion: @escaping ([Slipway]?, Error?) -> Void) {
        let dataStore = DataStore.shared
        debugPrint("Fetch slipway from \(Link.slipways)")
        self.webService.fetchSecuredData(link: Link.slipways, token: dataStore.token!.accessToken) { (data, error) in
            if error != nil{
                completion(nil, error)
            }
            else{
                if let safeData = data{
                    let slipways: [Slipway]? = self.serializer.parseObject(data: safeData)
                    if let safeSlipways = slipways{
                        let updatedSlipways = safeSlipways.map { (slipway) -> Slipway in
                            var tmpSlipway = slipway
                            let userData = self.appData.getSlipwayById(id: slipway.id)
                            if let saveUserData = userData{
                                tmpSlipway.isFavorite = saveUserData.isFavorite
                            }
                            return tmpSlipway
                        }
                        completion(updatedSlipways, nil)
                    }
                }
            }
        }
    }
}
