//
//  SlipwayInfo.swift
//  Slipways
//
//  Created by Marcel Benders on 31.10.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI

struct SlipwayInfo: View {
    var slipway: SlipwayQl
    @EnvironmentObject var dataStore: DataStore
    let waterViewModel = WaterViewModel()
    
    init(slipway: SlipwayQl) {
        // To remove only extra separators below the list:
        UITableView.appearance().tableFooterView = UIView()
        
        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
        self.slipway = slipway
    }
    
    var body: some View {
        List {
            Text("Straße: \(slipway.street)")
            Text("Stadt / Ort: \(slipway.city)")
            Text("PLZ: \(slipway.postalcode)")
            Text("Kosten: \(NSDecimalNumber(decimal: slipway.costs).stringValue) €")
            Text("Gewässer: \(slipway.water.name)")
        }
    }
}

struct SlipwayInfo_Previews: PreviewProvider {
    static var previews: some View {
        return SlipwayInfo(slipway: FakeData.slipway)
            .previewLayout(.sizeThatFits).environmentObject(DataStore.shared)
    }
}
