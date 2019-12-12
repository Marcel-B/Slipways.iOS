//
//  graphQLService.swift
//  Slipways
//
//  Created by Marcel Benders on 11.12.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import Foundation

class GraphQLService{
    func fetchEntity(with query: Data, completion: @escaping (_ result: Data?, _ error: Error?) -> Void){
        if let url = URL(string: Link.graphQL){
            let urlSession = URLSession(configuration: .default)
            var request = URLRequest(url: url)
            request.httpMethod = HttpMethod.post
            request.httpBody = query
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let task = urlSession.dataTask(with: request) { (data, response, error) in
                if error != nil{
                    completion(nil, error)
                }
                else{
                    completion(data, nil)
                }
            }
            task.resume()
        }
    }
}
