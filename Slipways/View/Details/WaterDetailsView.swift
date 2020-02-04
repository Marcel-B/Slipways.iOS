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
                Text("Stations")
                Spacer()
                Image("ruler")
            }
            ForEach(water.station?.allObjects as! [Station], id: \.self) { station in
                NavigationLink(destination: StationDetailsView(stationViewModel: StationViewModel(station))){
                    Text(station.name ?? String.Empty)
                            .font(.custom("Exo2-Regular", size: 22))
                }
            }
        }.navigationBarTitle(water.name ?? "n/a")
    }
}

struct WaterDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let water = FakeData.getWater()
        
        return Group{
            WaterDetailsView(water: water)
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
                .previewDisplayName("iPhone SE")
            
            WaterDetailsView(water: water)
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
            
            WaterDetailsView(water: water)
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .previewDisplayName("iPhone XS Max")
        }
    }
}

