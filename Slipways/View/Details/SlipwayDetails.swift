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
        return SlipwayDetails(slipway: Slipway())
    }
}
