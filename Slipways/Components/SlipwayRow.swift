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
        VStack{
            HStack{
                Text(slipway.name)
                    .font(.custom("Exo2-Regular", size: 22))
                Spacer()
                if slipway.favorite {
                    Image(systemName: "star.fill")
                        .imageScale(.medium)
                        .foregroundColor(.yellow)
                }
            }
            
            HStack{
                if slipway.costs > 0 {
                    Image(self.colorScheme == .light ? "dollar54Light" : "dollar54Dark")
                        .imageScale(.medium)
                }else if slipway.costs < 0 {
                    Image(self.colorScheme == .light ? "sad54Light" : "sad54Dark")
                        .imageScale(.medium)
                }else{
                    Image(self.colorScheme == .light ? "happy54Light" : "happy54Dark")
                        .imageScale(.medium)
                }
                
                if slipway.extras.contains(where: { (extra) -> Bool in
                    extra.name == "Campingplatz"
                }){
                    Image(self.colorScheme == .light ? "camping54Light" :  "camping54Dark")
                }
                
                if slipway.extras.contains(where: { (extra) -> Bool in
                    extra.name == "Parkplatz"
                }){
                    Image(self.colorScheme == .light ? "parking54Light" :  "parking54Dark")
                }
                
                if slipway.extras.contains(where: { (extra) -> Bool in
                    extra.name == "Steg"
                }){
                    Image(self.colorScheme == .light ? "pier54Light" :  "pier54Dark")
                }
                Spacer()
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
        return SlipwayRow(slipway: FakeData.slipway, dataStore: DataStore.shared)
            .previewLayout(.sizeThatFits)
    }
}
