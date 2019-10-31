//
//  SlipwayInfo.swift
//  Slipways
//
//  Created by Marcel Benders on 31.10.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI

struct SlipwayInfo: View {
    var slipway: Slipway
    
    var body: some View {
        VStack{
            HStack{
                Text("straße")
                    .font(.footnote)
                Spacer()
                Text(slipway.street)
            }.padding(.horizontal, 20)
            HStack{
                Text("ort")
                    .font(.footnote)
                Spacer()
                Text("\(slipway.postalcode) \(slipway.city)")
            }.padding(.horizontal, 20)
            HStack{
                     Text("gewässer")
                         .font(.footnote)
                     Spacer()
                     Text(slipway.water)
            }.padding(.horizontal, 20)
        }
    }
}

struct SlipwayInfo_Previews: PreviewProvider {
    static var previews: some View {
        SlipwayInfo(slipway: slipways[0])
    }
}
