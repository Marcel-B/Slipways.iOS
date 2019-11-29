//
//  SlipwayService.swift
//  Slipways
//
//  Created by Marcel Benders on 18.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import Foundation
import os.log

protocol CommonProtcol{
    func fetchSingleData(link: String)
}
protocol StationProtocol : CommonProtcol{
    func fetchData(link: String, completion: @escaping  (_ result: [Station]) -> Void)
    func fetchSecureSingleData(link: String, completion: @escaping (_ result: Station?) -> Void)
}
protocol WaterProtocol : CommonProtcol{
    func fetchData(link: String, completion: @escaping  (_ result: [Water]) -> Void)
    func fetchSecureSingleData(link: String, completion: @escaping (_ result: Water?) -> Void)
}

protocol SlipwayProtocol: CommonProtcol{
    func fetchData(link: String, completion: @escaping  (_ result: [Slipway]) -> Void)
    func fetchSecureSingleData(link: String, completion: @escaping (_ result: Slipway?) -> Void)
}

class WaterService: HttpService<Water>, WaterProtocol{}
class StationService: HttpService<Station>, StationProtocol{}
class SlipwayService: HttpService<Slipway>, SlipwayProtocol{}

class HttpService<T: Codable> {
    var data = [T]()
    var single: T?
    
    func fetchSingleData(link: String) {
        print(link)
        if let url = URL(string: link){
            let urlSession = URLSession(configuration: .default)
            var request = URLRequest(url: url)
            request.addValue(DataStore.shared.token!.accessToken, forHTTPHeaderField: "Authorization")
            request.httpMethod = HttpMethod.get
            let task = urlSession.dataTask(with: request) { (data, response, error) in
                if error != nil{
                    os_log("Error while fetching single element.", log: OSLog.default, type: .error)
                    return
                }
                if let safeData = data{
                    DispatchQueue.main.async {
                        self.single = Serializer.parseSingle(data: safeData)
                    }
                }
            }
            task.resume()
        }
    }
    
    func fetchSecureSingleData(link: String, completion: @escaping (_ result: T?) -> Void){
        if let url = URL(string: link){
            let urlSession = URLSession(configuration: .default)
            var request = URLRequest(url: url)
            request.addValue(DataStore.shared.token!.accessToken, forHTTPHeaderField: "Authorization")
            request.httpMethod = HttpMethod.get
            let task = urlSession.dataTask(with: request)  {(data, response, error) in
                if error != nil {
                    os_log("Error while fetching single element.", log: OSLog.default, type: .error)
                    completion(nil)
                    return
                }
                if let safeData = data{
                    if let type: T = Serializer.parseSingle(data: safeData) {
                        DispatchQueue.main.async{
                            completion(type)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    func fetchData(link: String, completion: @escaping  (_ result: [T]) -> Void) {
        if let url = URL(string: link){
            
            let urlSession = URLSession(configuration: .default)
            var request = URLRequest(url: url)
            if DataStore.shared.token == nil{
                TokenService.getToken { (token) in
                    request.addValue("Bearer \(token!.accessToken)", forHTTPHeaderField: "Authorization")
                    request.httpMethod = "GET"
                    let task = urlSession.dataTask(with: request) { (data, response, error) in
                        if error != nil{
                            os_log("Error while fetching elements.", log: OSLog.default, type: .error)
                            completion([T]())
                            return
                        }
                        
                        if let safeData = data {
                            if let types: [T] = Serializer.parse(data: safeData) {
                                DispatchQueue.main.async {
                                    self.data = types
                                    completion(types)
                                }
                            }
                        }
                    }
                    task.resume()
                }
            }else{
                request.addValue(DataStore.shared.token!.accessToken, forHTTPHeaderField: "Authorization")
                request.httpMethod = "GET"
                let task = urlSession.dataTask(with: request) { (data, response, error) in
                    if error != nil{
                        os_log("Error while fetching elements.", log: OSLog.default, type: .error)
                        completion([T]())
                        return
                    }
                    
                    if let safeData = data {
                        if let types: [T] = Serializer.parse(data: safeData) {
                            DispatchQueue.main.async {
                                self.data = types
                                completion(types)
                            }
                        }
                    }
                }
                task.resume()
            }
            
        }
    }
}
