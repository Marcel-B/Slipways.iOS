//
//  WaterDetailsView.swift
//  Slipways
//
//  Created by Marcel Benders on 23.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI

struct WaterDetailsView: View {
    let water: Water
    var body: some View {
        List{
            HStack{
                Text("Stationen")
                Spacer()
                Image("ruler")
            }
            ForEach(water.station?.allObjects as! [Station], id: \.self) { station in
                NavigationLink(destination: StationDetailsView(stationViewModel: StationViewModel() ,station: station )){
                    Text(station.name ?? "n/a")
                            .font(.custom("Exo2-Regular", size: 22))
                }
            }
        }.navigationBarTitle(water.name ?? "n/a")
    }
}

struct WaterDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        WaterDetailsView(water: Water())
    }
}

