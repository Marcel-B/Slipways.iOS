//
//  ServiceDetails.swift
//  Slipways
//
//  Created by Marcel Benders on 16.12.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI
import MapKit

struct ServiceDetails: View {
    let service: Service
    
    var body: some View {
        ScrollView{
            VStack{
                MapWrapperView(coordinate: CLLocationCoordinate2D (latitude: service.latitude, longitude: service.longitude), targetName: service.name ?? "n/a")
                    .frame(height: 400)
                    .padding(.horizontal)
                ServiceInfo(service: service)
                    .padding(.horizontal)
            }
        }.navigationBarTitle(service.name ?? "n/a")
    }
}

struct ServiceDetails_Previews: PreviewProvider {
    static var previews: some View {
        ServiceDetails(service: Service())
    }
}
