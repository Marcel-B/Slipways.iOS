//
//  Serializer.swift
//  Slipways
//
//  Created by Marcel Benders on 29.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import Foundation

protocol ObjectParser{
    func parseObject<T: Codable>(data: Data) -> T?
}
