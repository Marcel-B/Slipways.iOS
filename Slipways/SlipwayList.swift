//
//  ContentView.swift
//  Slipways
//
//  Created by Marcel Benders on 31.10.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI

struct SlipwayList: View {
    var slipways: [Slipway]
    var body: some View {
        NavigationView{
            List{
                ForEach(slipways) { slipway in
                    NavigationLink(destination: SlipwayDetails(slipway: slipway)) {
                        SlipwayRow(slipway: slipway)
                    }
                }
            }
            .navigationBarTitle("Slipanlagen")
        }
    }
}

struct SlipwayList_Previews: PreviewProvider {
    static var previews: some View {
        SlipwayList(slipways: slipways)
    }
}
