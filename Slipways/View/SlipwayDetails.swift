//
//  SlipwayDetails.swift
//  Slipways
//
//  Created by Marcel Benders on 31.10.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI

struct SlipwayDetails: View {
    @EnvironmentObject var userData: UserData
    var slipway: Slipway
    
    var body: some View {
        VStack{
            MapView(coordinate: slipway.locationCoordinate)
                .frame(height: 300)
            NameSign(slipway: slipway)
                .padding(.top, -7)
                .environmentObject(userData)
            SlipwayInfo(slipway: slipway)
                .padding(.top, 23)
            Spacer()
        }
    }
}

struct SlipwayDetails_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return SlipwayDetails(slipway: userData.slipways[0])
        .environmentObject(UserData())
    }
}
