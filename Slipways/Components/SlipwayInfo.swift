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
    
    var body: some View {
        List {
            Text("Straße: \(slipway.street)")
            Text("Stadt / Ort: \(slipway.city)")
            Text("PLZ: \(slipway.postalcode)")
            Text("Kosten: \(NSDecimalNumber(decimal: slipway.costs).stringValue) €")
            Text("Gewässer: \(slipway.water.name)")
        }.padding(.horizontal, 20)
    }
}

struct SlipwayInfo_Previews: PreviewProvider {
    static var previews: some View {
        return SlipwayInfo(slipway: FakeData().slipway)
            .previewLayout(.sizeThatFits).environmentObject(DataStore.shared)
    }
}
