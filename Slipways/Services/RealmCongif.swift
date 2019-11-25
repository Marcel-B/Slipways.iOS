//
//  File.swift
//  Slipways
//
//  Created by Marcel Benders on 25.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import Foundation
import RealmSwift

struct RealmConfig{
    
    let config = Realm.Configuration(
        // Set the new schema version. This must be greater than the previously used
        // version (if you've never set a schema version before, the version is 0).
        schemaVersion: 0,
        migrationBlock: { migration, oldSchemaVersion in
            if oldSchemaVersion < 0 {
                // Apply any necessary migration logic here.
            }
    })
}
