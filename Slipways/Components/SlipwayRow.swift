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
    var body: some View {
        HStack{
            Text(slipway.name)
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
    }
}

struct SlipwayRow_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return SlipwayRow(slipway: userData.slipways[0])
    }
}
