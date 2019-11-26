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
    func fetchSingleData(link: String, completion: @escaping (_ result: Station?) -> Void)
}
protocol WaterProtocol : CommonProtcol{
    func fetchData(link: String, completion: @escaping  (_ result: [Water]) -> Void)
    func fetchSingleData(link: String, completion: @escaping (_ result: Water?) -> Void)
}

protocol SlipwayProtocol: CommonProtcol{
    func fetchData(link: String, completion: @escaping  (_ result: [Slipway]) -> Void)
    func fetchSingleData(link: String, completion: @escaping (_ result: Slipway?) -> Void)
}

class WaterService: HttpService<Water>, WaterProtocol{}
class StationService: HttpService<Station>, StationProtocol{}
class SlipwayService: HttpService<Slipway>, SlipwayProtocol{}

class HttpService<T: Codable> {
    
    var data = [T]()
    var single: T?
    
    func parse(data: Data) -> [T]? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode([T].self, from: data)
            return decodedData
        }catch{
            os_log("Error while parsing element.", log: OSLog.default, type: .error)
            return nil
        }
    }
    
    func parseSingle(data: Data) -> T? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(T.self, from: data)
            return decodedData
        }catch{
            os_log("Error while parsing single element.", log: OSLog.default, type: .error)
            return nil
        }
    }
    
    func fetchSingleData(link: String) {
        print(link)
        if let url = URL(string: link){
            let urlSession = URLSession(configuration: .default)
            let task = urlSession.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    os_log("Error while fetching single element.", log: OSLog.default, type: .error)
                    return
                }
                if let safeData = data{
                    DispatchQueue.main.async {
                        self.single = self.parseSingle(data: safeData)
                    }
                }
            }
            task.resume()
        }
    }
    
    func fetchSingleData(link: String, completion: @escaping (_ result: T?) -> Void){
        if let url = URL(string: link){
            let urlSession = URLSession(configuration: .default)
            let task = urlSession.dataTask(with: url)  {(data, response, error) in
                if error != nil {
                    os_log("Error while fetching single element.", log: OSLog.default, type: .error)
                    completion(nil)
                    return
                }
                if let safeData = data{
                    if let type = self.parseSingle(data: safeData){
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
            
            let task = urlSession.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    os_log("Error while fetching elements.", log: OSLog.default, type: .error)
                    completion([T]())
                    return
                }
                
                if let safeData = data {
                    if let types = self.parse(data: safeData){
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
