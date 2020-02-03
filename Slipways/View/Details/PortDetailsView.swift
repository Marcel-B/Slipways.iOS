//
//  PortDetailsView.swift
//  Slipways
//
//  Created by Marcel Benders on 27.01.20.
//  Copyright © 2020 Marcel Benders. All rights reserved.
//

import SwiftUI
import MapKit

struct PortDetailsView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme

    let port: Port
    var body: some View {
        ScrollView{
            VStack{
                Group{
                    MapWrapperView(coordinates: port.locationCoordinates(), targetName: port.name ?? String.Empty)
                        .frame(height: 400)
                    ContactDetailsView(content: port)
                }.padding()
                
                List{
                    ForEach(port.slipway?.allObjects as! [Slipway]){ slipway in
                        NavigationLink(destination: SlipwayDetails(slipway: slipway)){
                            HStack{
                                Image(self.colorScheme == .light ? "boatLaunch54Light" :  "boatLaunch54Dark")
                                Text(slipway.name ?? String.Empty)
                            }
                        }
                    }
                }.frame(height: 400)
            }
        }
        .navigationBarTitle(port.name ?? String.Empty)
    }
}

struct PortDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PortDetailsView(port: Port())
    }
}
