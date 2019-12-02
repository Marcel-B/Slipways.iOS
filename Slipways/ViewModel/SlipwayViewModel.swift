//
//  SlipwayViewModel.swift
//  Slipways
//
//  Created by Marcel Benders on 29.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import Foundation

class SlipwayViewModel{
    
    let slipwayService: SlipwayProtocol
    let serializer: ObjectParser
    let appData: DataBase
    
    init(_ slipwayService: SlipwayProtocol = SlipwayService(), _ serializer: ObjectParser = Serializer(), _ appData: DataBase = AppData()){
        self.slipwayService = slipwayService
        self.serializer = serializer
        self.appData = appData
    }
    
    func getSlipways() -> [Slipway]{
        let dataStore = DataStore.shared
        if dataStore.slipways.count == 0{
            slipwayService.getSlipways { (slipways, error) in
                if error != nil{
                    debugPrint("Failed to fetch Slipways")
                }else{
                    if let safeSlipways = slipways{
                        DispatchQueue.main.async {
                            dataStore.slipways = safeSlipways
                        }
                    }
                }
            }
        }
        return dataStore.slipways
    }
}
