//
//  WsvService.swift
//  Slipways
//
//  Created by Marcel Benders on 31.10.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import Foundation

class WsvService : ObservableObject{
    @Published var waters = [Water]()
    
    func parseJSON(_ waters: Data) -> [Water]? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode([Water].self, from: waters)
            return decodedData
        }catch{
            print(error)
            return nil
        }
    }
    
    func loadWsv(){
        // Create a url
        if let url =  URL(string: Links().waters){
            
            // Create a URLSession
            let urlSession = URLSession(configuration: .default)
            
            // Give the session a task
            let task =  urlSession.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    print("Shit happens")
                    return
                }
                if let safeData = data{
                    if let waters =  self.parseJSON(safeData){
                        DispatchQueue.main.async {
                            self.waters = waters
                        }
                    }
                }
            }
            // Start the task
            task.resume()
        }
    }
}
