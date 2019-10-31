//
//  SlipwayDetails.swift
//  Slipways
//
//  Created by Marcel Benders on 31.10.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI

struct SlipwayDetails: View {
    var slipway: Slipway
    var body: some View {
        VStack{
            Text(slipway.name)
            MapView(coordinate: slipway.locationCoordinate)
        }
    }
}

struct SlipwayDetails_Previews: PreviewProvider {
    static var previews: some View {
        SlipwayDetails(slipway: slipways[0])
    }
}
