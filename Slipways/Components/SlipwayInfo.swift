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
        return VStack {
            HStack {
                Text("straße")
                    .font(.footnote)
                Spacer()
                Text(slipway.street ?? "-")
            }
            HStack {
                Text("stadt / ort")
                    .font(.footnote)
                Spacer()
                Text(slipway.city ?? "-")
            }
            HStack {
                Text("postleitzahl")
                    .font(.footnote)
                Spacer()
                Text(slipway.postalcode ?? "-")
            }
            HStack {
                Text("kosten")
                    .font(.footnote)
                Spacer()
                Text("\(NSDecimalNumber(decimal: slipway.costs).stringValue) €")
            }
        }.padding(.horizontal, 20)
    }
}

struct SlipwayInfo_Previews: PreviewProvider {
    static var previews: some View {
        return SlipwayInfo(slipway: FakeData().slipway)
    }
}
