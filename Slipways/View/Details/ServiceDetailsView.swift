//
//  ServiceDetails.swift
//  Slipways
//
//  Created by Marcel Benders on 16.12.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI
import MapKit

struct ServiceDetailsView: View {
    let service: Service
    
    var body: some View {
        ScrollView{
            VStack{
                MapWrapperView(coordinates: self.service.locationCoordinates(), targetName: service.name ?? String.Empty)
                    .frame(height: 400)
                    .padding(.horizontal)
                ServiceInfo(service: service)
                    .padding(.horizontal)
            }
        }.navigationBarTitle(service.name ?? String.Empty)
    }
}

struct ServiceDetails_Previews: PreviewProvider {
    static var previews: some View {
        ServiceDetailsView(service: Service())
    }
}
