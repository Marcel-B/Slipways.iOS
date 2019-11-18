//
//  SlipwayService.swift
//  Slipways
//
//  Created by Marcel Benders on 18.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import Foundation

class SlipwayService : ObservableObject{
    @Published var stations = [Station]()
    
    func parseJSON(_ stations: Data) -> [Station]? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode([Station].self, from: stations)
            return decodedData
        }catch{
            print(error)
            return nil
        }
    }
    
    func loadStations(){
        // Create a url
        if let url =  URL(string: Links().stations){
            
            // Create a URLSession
            let urlSession = URLSession(configuration: .default)
            
            // Give the session a task
            let task =  urlSession.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    print("Shit happens")
                    return
                }
                if let safeData = data{
                    if let stations =  self.parseJSON(safeData){
                        DispatchQueue.main.async {
                            self.stations = stations
                        }
                    }
                }
            }
            // Start the task
            task.resume()
        }
    }
}
