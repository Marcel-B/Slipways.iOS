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
                MapView(coordinate: CLLocationCoordinate2D (latitude: slipway.latitude, longitude: slipway.longitude))
                    .frame(height: 320)
                    .padding()
                
                ButtonLineView(favorite: slipway.favorite, slipway: slipway)
                    .padding(.horizontal)
                
                SlipwayInfo(slipway: slipway)
                    .padding()
//                Spacer()
            }
        }.navigationBarTitle(slipway.name ?? "n/a")
    }
}

struct SlipwayDetails_Previews: PreviewProvider {
    static var previews: some View {
        return SlipwayDetails(slipway: Slipway())
    }
}
