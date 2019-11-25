//
//  SlipwayService.swift
//  Slipways
//
//  Created by Marcel Benders on 18.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import Foundation


//protocol CommonService{
//    associatedtype T
//    func fetchData(link: String, completion: @escaping  (_ result: [T]) -> Void)
//    func fetchSingleData(link: String, completion: @escaping (_ result: T?) -> Void)
//    func fetchSingleData(link: String)
//}

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
            print(error)
            return nil
        }
    }
    
    func parseSingle(data: Data) -> T? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(T.self, from: data)
            return decodedData
        }catch{
            print(error)
            return nil
        }
    }
    
    func fetchSingleData(link: String) {
        print(link)
        if let url = URL(string: link){
            let urlSession = URLSession(configuration: .default)
            let task = urlSession.dataTask(with: url) { (data, response, error) in
                if error != nil{
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
