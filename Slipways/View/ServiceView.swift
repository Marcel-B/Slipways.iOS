//
//  ServiceView.swift
//  Slipways
//
//  Created by Marcel Benders on 16.12.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI

struct ServiceView: View {
    @EnvironmentObject var baseDataStore: DataStore
    
    var body: some View {
        List{
            ForEach(baseDataStore.data.services) { service in
                NavigationLink(destination: ServiceDetails(service: service)){
                    VStack{
                        HStack{
                            Text(service.name)
                                .font(.custom("Exo2-Regular", size: 22))
                            Spacer()
                        }
                        HStack{
                            Image(systemName: "mappin.and.ellipse")
                                .imageScale(.small)
                            Text(service.city)
                                .font(.footnote)
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}

struct ServiceView_Previews: PreviewProvider {
    static var previews: some View {
        ServiceView()
            .environmentObject(DataStore.shared)
    }
}
