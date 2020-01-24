//
//  ServiceView.swift
//  Slipways
//
//  Created by Marcel Benders on 16.12.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI

struct ServiceView: View {
    @FetchRequest(entity: Service.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Service.name, ascending: true)]) var services: FetchedResults<Service>

    var body: some View {
        List{
            ForEach(services, id: \.self.id!) { service in
                NavigationLink(destination: ServiceDetails(service: service)){
                    VStack{
                        HStack{
                            Text(service.name ?? "n/a")
                                .font(.custom("Exo2-Regular", size: 22))
                            Spacer()
                        }
                        HStack{
                            Image(systemName: "mappin.and.ellipse")
                                .imageScale(.small)
                            Text(service.city ?? "n/a")
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
    }
}
