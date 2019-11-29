//
//  Token.swift
//  Slipways
//
//  Created by Marcel Benders on 28.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import Foundation

struct Token: Codable{
    let accessToken: String
    let expiresIn: Int
    let tokenType: String
    let scope: String
    enum CodingKeys : String, CodingKey {
        case accessToken = "access_token"
        case expiresIn = "expires_in"
        case tokenType = "token_type"
        case scope
    }
}
