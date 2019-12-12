//
//  SlipwayRow.swift
//  Slipways
//
//  Created by Marcel Benders on 05.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI

struct SlipwayRow: View {
    var slipway: SlipwayQl
    @ObservedObject var dataStore: DataStore = DataStore.shared
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        return VStack{
            HStack{
                Text(slipway.name)
                    .font(.custom("Exo2-Regular", size: 22))
                Spacer()
                
                
                if slipway.extras.contains(where: { (extra) -> Bool in
                    extra.name == "Campingplatz"
                }){
                    Image(self.colorScheme == .light ? "campingLight" :  "campingDark")
                }
                
                if slipway.extras.contains(where: { (extra) -> Bool in
                    extra.name == "Parkplatz"
                }){
                    Image(self.colorScheme == .light ? "parkingLight" :  "parkingDark")
                }
                
                if slipway.costs > 0 {
                    Image(systemName: "dollarsign.circle")
                        .imageScale(.medium)
                }
                
                if slipway.isFavorite ?? false {
                    Image(systemName: "star.fill")
                        .imageScale(.medium)
                        .foregroundColor(.yellow)
                }
            }
            HStack{
                Image(systemName: "mappin.and.ellipse")
                    .imageScale(.small)
                Text(slipway.city)
                    .font(.footnote)
                Spacer()
                Text(slipway.water.name)
                    .font(.footnote)
            }
        }
    }
}

struct SlipwayRow_Previews: PreviewProvider {
    static var previews: some View {
        return SlipwayRow(slipway: FakeData().slipway, dataStore: DataStore.shared)
            .previewLayout(.sizeThatFits)
    }
}
