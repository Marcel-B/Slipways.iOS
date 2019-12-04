//
//  SlipwayRow.swift
//  Slipways
//
//  Created by Marcel Benders on 05.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI

struct SlipwayRow: View {
    var slipway: Slipway
    @ObservedObject var dataStore: DataStore = DataStore.shared
    var body: some View {
        let water = dataStore.waters.firstIndex { (water) -> Bool in
            water.id == self.slipway.waterFk
        }
        return VStack{
            HStack{ Text(slipway.name)
                .font(.custom("Exo2-Regular", size: 22))
                Spacer()
                
                Spacer()
                if(slipway.costs > 0){
                    Image(systemName: "dollarsign.circle")
                        .imageScale(.medium)
                }
                if(slipway.isFavorite ?? false){
                    Image(systemName: "star.fill")
                        .imageScale(.medium)
                        .foregroundColor(.yellow)
                }
                
            }
            HStack{
                Image("waves")
                    .resizable() .aspectRatio(contentMode: .fit)
                    .frame(width: 20.0, height: 20.0)
                Spacer()
                Text(dataStore.waters[water ?? 0].name)
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
