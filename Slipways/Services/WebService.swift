//
//  WebService.swift
//  Slipways
//
//  Created by Marcel Benders on 01.12.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import Foundation
import os.log

class WebService{
    
    func fetchData(link: String, completion: @escaping (_ result: Data?, _ error: Error?) -> Void) {
        if let url = URL(string: link) {
            let urlSession = URLSession(configuration: .default)
            let task = urlSession.dataTask(with: url)  {(data, response, error) in
                if error != nil {
                    os_log("[WebService] Error while fetching data", log: OSLog.default, type: .error)
                    completion(nil, error)
                }else{
                    completion(data, nil)
                }
            }
            task.resume()
        }
    }
    
    func fetchSecuredData(link: String, token: String, completion: @escaping (_ result: Data?, _ error: Error?) -> Void){
        if let url = URL(string: link){
            let urlSession = URLSession(configuration: .default)
            var request = URLRequest(url: url)
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            request.httpMethod = HttpMethod.get
            let task = urlSession.dataTask(with: request) { (data, response, error) in
                if error != nil{
                    completion(nil, error)
                }else{
                    completion(data, nil)
                }
            }
            task.resume()
        }
    }
}
