//
//  SlipwayService.swift
//  Slipways
//
//  Created by Marcel Benders on 18.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import Foundation

class PegelService : ObservableObject{
    
}



class SlipwayService<T: Codable> : ObservableObject{
    
    @Published var data = [T]()
    @Published var single: T?
    
    func parse(data: Data) -> [T]? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode([T].self, from: data)
            return decodedData
        }catch{
            print("Foobar")
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
            print("Foobar")
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
    
    func fetchData(link: String) {
        if let url = URL(string: link){
            let urlSession = URLSession(configuration: .default)
            let task = urlSession.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    return
                }
                if let safeData = data{
                    if let types = self.parse(data: safeData){
                        DispatchQueue.main.async {
                            self.data = types
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
