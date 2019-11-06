//
//  SlipwayDb.swift
//  Slipways
//
//  Created by Marcel Benders on 06.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//
import Foundation
import RealmSwift

class SlipwayDb: Object {
    @objc dynamic var index = 0
    @objc dynamic var isFavorite = false
}
