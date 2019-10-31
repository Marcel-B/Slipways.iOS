//
//  WsvService.swift
//  Slipways
//
//  Created by Marcel Benders on 31.10.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import Foundation
import Alamofire

func loadWsv(){
    // Alamofire 4
    Alamofire.request("https://www.pegelonline.wsv.de/webservices/rest-api/v2/stations.json").response { response in // method defaults to `.get`
        debugPrint(response)
    }
}
