//
//  TokenService.swift
//  Slipways
//
//  Created by Marcel Benders on 28.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import Foundation
import os.log

protocol TokenProtocol{
    func getToken(completion: @escaping (_ token: Token?) -> Void)
}

class TokenService: TokenProtocol{
    
    let serializer: ObjectParser
    
    init(_ serializer: ObjectParser = Serializer()){
        self.serializer = serializer
    }
    
    func getToken(completion: @escaping (_ token: Token?) -> Void) {
        debugPrint("Fetch token")
        let contentType = "application/x-www-form-urlencoded"
        if let url = URL(string: "https://identity.qaybe.de/connect/token"){
            let session = URLSession.shared
            var request = URLRequest(url: url)
            request.httpMethod =  HttpMethod.post
            request.setValue(contentType, forHTTPHeaderField: "Content-Type")
            request.setValue("Basic c2xpcHdheXMuaW9zOmxBZGZhMjMyZiFhc2RmXzUwQXNnSzItMQ==", forHTTPHeaderField:"Authorization")
            let data = Data( "grant_type=client_credentials&scope=slipways.api.reader".utf8)
            let task =  session.uploadTask(with: request, from: data) { data, response, error in
                if let json = data{
                    let value: Token? = self.serializer.parseObject(data: json)
                    completion(value)
                }
            }
            task.resume()   
        }
    }
}
