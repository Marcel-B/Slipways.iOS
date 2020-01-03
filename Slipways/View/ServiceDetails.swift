//
//  ServiceDetails.swift
//  Slipways
//
//  Created by Marcel Benders on 16.12.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI

struct ServiceDetails: View {
    let service: ServiceQl
    
    var body: some View {
        ScrollView{
            VStack{
                MapWrapperView(coordinate: service.locationCoordinate, targetName: service.name)
                    .frame(height: 400)
                    .padding(.horizontal)
                ServiceInfo(service: service)
                    .padding(.horizontal)
            }
        }.navigationBarTitle(service.name)
    }
}

struct ServiceDetails_Previews: PreviewProvider {
    static var previews: some View {
        ServiceDetails(service: FakeData.service)
    }
}
