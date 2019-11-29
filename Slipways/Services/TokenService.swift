//
//  TokenService.swift
//  Slipways
//
//  Created by Marcel Benders on 28.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import Foundation
import os.log

class TokenService{
    static let post = "POST"
    
    static func getToken(completion: @escaping (_ token: Token?) -> Void) {
        let contentType = "application/x-www-form-urlencoded"
        if let url = URL(string: "https://newidentity.qaybe.de/connect/token"){
            let session = URLSession.shared
            var request = URLRequest(url: url)
            request.httpMethod =  post//"POST"
            request.setValue(contentType, forHTTPHeaderField: "Content-Type")
            request.setValue("Basic c2xpcHdheXMuaW9zOmxBZGZhMjMyZiFhc2RmXzUwQXNnSzItMQ==", forHTTPHeaderField:"Authorization")
            let data = Data( "grant_type=client_credentials&scope=slipways.writer".utf8)
            let task =  session.uploadTask(with: request, from: data) { data, response, error in
                // Do something...
                if let json = data{
                    let value: Token? = Serializer.parseSingle(data: json)
                    completion(value)
                }
            }
            
            task.resume()   
        }
    }
}
