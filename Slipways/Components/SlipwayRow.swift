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
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        VStack{
            HStack{
                Text(slipway.name ?? "n/a")
                    .font(.custom("Exo2-Regular", size: 22))
                Spacer()
                if slipway.favorite {
                    Image(systemName: "star.fill")
                        .imageScale(.medium)
                        .foregroundColor(.yellow)
                }
            }
            
            HStack{
                if Int(truncating: slipway.costs!) > 0 {
                    Image(self.colorScheme == .light ? "dollar54Light" : "dollar54Dark")
                        .imageScale(.medium)
                }else if Int(truncating: slipway.costs!) < 0 {
                    Image(self.colorScheme == .light ? "sad54Light" : "sad54Dark")
                        .imageScale(.medium)
                }else{
                    Image(self.colorScheme == .light ? "happy54Light" : "happy54Dark")
                        .imageScale(.medium)
                }
                
                if (slipway.extra?.allObjects as! [Extra]).contains(where: { (extra) -> Bool in
                    extra.name == "Campingplatz"
                }){
                    Image(self.colorScheme == .light ? "camping54Light" :  "camping54Dark")
                }
                
                if (slipway.extra?.allObjects as! [Extra]).contains(where: { (extra) -> Bool in
                    extra.name == "Parkplatz"
                }){
                    Image(self.colorScheme == .light ? "parking54Light" :  "parking54Dark")
                }
                
                if (slipway.extra?.allObjects as! [Extra]).contains(where: { (extra) -> Bool in
                    extra.name == "Steg"
                }){
                    Image(self.colorScheme == .light ? "pier54Light" :  "pier54Dark")
                }
                Spacer()
            }
            
            HStack{
                Image(systemName: "mappin.and.ellipse")
                    .imageScale(.small)
                Text(slipway.city ?? "n/a")
                    .font(.footnote)
                Spacer()
                Text(slipway.water!.name ?? "n/a")
                    .font(.footnote)
            }
        }
    }
}

struct SlipwayRow_Previews: PreviewProvider {
    static var previews: some View {
        return SlipwayRow(slipway: Slipway())
            .previewLayout(.sizeThatFits)
    }
}
