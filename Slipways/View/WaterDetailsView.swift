//
//  WaterDetailsView.swift
//  Slipways
//
//  Created by Marcel Benders on 23.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI

struct WaterDetailsView: View {
    @ObservedObject var dataStore = DataStore.shared
    let water: Water
    var body: some View {
        VStack {
            Text(water.longname)
                .padding()
            List(dataStore.getStationsByExpression(exp: { (station) -> Bool in
                self.water.id == station.waterFk
            })) { station in
                NavigationLink(destination: StationDetailsView(stationViewModel: StationViewModel(nil,nil), station: station, value: "")){
                    Text(station.longname)
                }
            }
        }.navigationBarTitle(water.shortname.lowercased())
    }
}

struct WaterDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        WaterDetailsView(water: FakeData().water)
    }
}
