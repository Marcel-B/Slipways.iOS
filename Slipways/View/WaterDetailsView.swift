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
    let water: WaterQl
    
    var body: some View {
        List{
            
            HStack{
                Text("Stationen")
                Spacer()
                Image("ruler")
            }
            ForEach(water.stations!) { station in
                
                NavigationLink(destination: StationDetailsView(stationViewModel: StationViewModel(), station: station)){
                    Text(station.name)
                        .font(.custom("Exo2-Regular", size: 22))
                }
            }
        }.navigationBarTitle(water.name)
    }
}

struct WaterDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        WaterDetailsView(water: FakeData.water)
    }
}
