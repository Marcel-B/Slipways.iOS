//
//  ExtraExtensions.swift
//  Slipways
//
//  Created by Marcel Benders on 24.01.20.
//  Copyright © 2020 Marcel Benders. All rights reserved.
//

import Foundation

extension Extra{
    func fromExtraQl(_ ql: ExtraQl){
        self.lastUpdate = ql.updated
        self.name = ql.name
    }
}
