//
//  SlipwayDetails.swift
//  Slipways
//
//  Created by Marcel Benders on 31.10.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI
import MapKit

struct SlipwayDetails: View {
    var slipway: Slipway
    
    var body: some View {
        ScrollView{
            VStack{
                MapView(coordinates: slipway.locationCoordinates())
                    .frame(height: 320)
                    .padding()
                
                ButtonLineView(favorite: slipway.favorite, slipway: slipway)
                    .padding(.horizontal)
                
                SlipwayInfo(viewModel: SlipwayInfoViewModel(slipway))
                    .padding()
            }
        }.navigationBarTitle(slipway.name ?? String.Empty)
    }
}

struct SlipwayDetails_Previews: PreviewProvider {
    static var previews: some View {
        let slipway = FakeData.getSlipway()
        return Group{
            SlipwayDetails(slipway: slipway)
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
                .previewDisplayName("iPhone SE")
            
            SlipwayDetails(slipway: slipway)
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
            
            SlipwayDetails(slipway: slipway)
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .previewDisplayName("iPhone XS Max")
        }
    }
}
