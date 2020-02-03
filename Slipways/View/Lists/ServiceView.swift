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
    @State var search: String = ""
    
    var body: some View {
        List{
            HStack{
                TextField("Search", text: $search)
                Image(systemName: "magnifyingglass")
            }
            
            ForEach(services.filter( { service in self.match(service) } ), id: \.self.id!) { service in
                NavigationLink(destination: ServiceDetailsView(service: service)){
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
        }.navigationBarTitle("Workshops", displayMode: .large)
    }
    
    func match(_ service: Service) -> Bool {
        let search = self.search.uppercased()
        if search == "" {
            return true
        }
        
        if let name = service.name {
            if name.uppercased().starts(with: search){
                return true
            }
        }else if let city = service.city {
            if city.uppercased().starts(with: search){
                return true
            }
        }
        return false
    }
}

struct ServiceView_Previews: PreviewProvider {
    static var previews: some View {
        ServiceView()
    }
}
