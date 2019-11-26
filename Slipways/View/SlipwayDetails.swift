//
//  SlipwayDetails.swift
//  Slipways
//
//  Created by Marcel Benders on 31.10.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI

struct SlipwayDetails: View {
    @EnvironmentObject var dataStore: DataStore
    var slipway: Slipway
    
    var body: some View {
        VStack{
            MapView(coordinate: slipway.locationCoordinate)
                .frame(height: 300)
            NameSign(slipway: slipway)
                .environmentObject(self.dataStore)
                .padding(.top, -7)
            SlipwayInfo(slipway: slipway)
                .padding(.top, 23)
            Spacer()
        }.navigationBarTitle(dataStore.getWater(id: slipway.waterFk)?.longname ?? "")
    }
}

struct SlipwayDetails_Previews: PreviewProvider {
    static var previews: some View {
        return SlipwayDetails(slipway: FakeData().slipway).environmentObject(DataStore.shared)
    }
}
