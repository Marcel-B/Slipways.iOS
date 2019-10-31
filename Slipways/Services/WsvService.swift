//
//  WsvService.swift
//  Slipways
//
//  Created by Marcel Benders on 31.10.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import Alamofire

func loadWsv(){
    // Alamofire 4
    // "https://www.pegelonline.wsv.de/webservices/rest-api/v2/stations.json?waters=RUHR"
    Alamofire.request("https://www.pegelonline.wsv.de/webservices/rest-api/v2/stations/12a3037f-cbf3-49d3-8da5-77fb38730bba/W/measurements.json", method: .get).responseJSON
        { response in
            guard response.result.isSuccess,
                let value = response.result.value else{
                    print("Error")
                    return
            }
            debugPrint(value)
    }
}
