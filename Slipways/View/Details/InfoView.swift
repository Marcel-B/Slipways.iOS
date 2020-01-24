//
//  InfoView.swift
//  Slipways
//
//  Created by Marcel Benders on 23.01.20.
//  Copyright © 2020 Marcel Benders. All rights reserved.
//

import SwiftUI

struct InfoView: View {
    @FetchRequest(entity: Slipway.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Slipway.name, ascending: true)]) var slipways: FetchedResults<Slipway>
    @FetchRequest(entity: Water.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Water.name, ascending: true)]) var waters: FetchedResults<Water>
    @FetchRequest(entity: Service.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Service.name, ascending: true)]) var services: FetchedResults<Service>
    @FetchRequest(entity: Port.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Port.name, ascending: true)]) var ports: FetchedResults<Port>
    @FetchRequest(entity: Station.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Station.name, ascending: true)]) var stations: FetchedResults<Station>
    
    var body: some View {
        VStack{
            Text("\(slipways.count) Slipanlagen")
            Text("\(waters.count) Gewässer")
            Text("\(services.count) Werkstätten")
            Text("\(stations.count) Stationen")
            Text("\(ports.count) Marinas")
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
