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
        VStack{
            MapWrapperView(coordinate: service.locationCoordinate, targetName: service.name)
                .padding()
            List {
                
                HStack{
                    Image(systemName: "envelope")
                    Text(service.street)
                    Text("- \(service.postalcode)")
                    Text(service.city)
                }
                HStack{
                    Image(systemName: "phone")
                    Text(service.phone ?? "-")
                        .onTapGesture {
                            if let urlStr = self.service.phone{
                                if let uri = URL(string: "tel://\(urlStr)"){
                                    UIApplication.shared.open(uri)
                                }
                            }
                    }.foregroundColor(.accentColor)
                }
                HStack{
                    Image(systemName: "globe")
                    Text(service.url ?? "-")
                        .onTapGesture {
                            if let urlStr = self.service.url{
                                if let uri = URL(string: urlStr){
                                    UIApplication.shared.open(uri)
                                }
                            }
                    }.foregroundColor(.accentColor)
                }
                HStack{
                    Image(systemName: "at")
                    Text(service.email ?? "-")
                }
                Text("Hersteller:")
                ForEach(service.manufacturersList){manufacturer in
                    Text(manufacturer.name)
                }.padding(.leading)
            }
        }.navigationBarTitle(service.name)
    }
}

struct ServiceDetails_Previews: PreviewProvider {
    static var previews: some View {
        ServiceDetails(service: FakeData.service)
    }
}
