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
            HStack{
                Text("Slipways")
                Spacer()
                Text("\(slipways.count)")
            }
            HStack{
                Text("Waters")
                Spacer()
                Text("\(waters.count)")
            }
            HStack{
                
                Text("Workshops")
                Spacer()
                Text("\(services.count)")
            }
            HStack{
                
                Text("Stations")
                Spacer()
                Text("\(stations.count)")
            }
            HStack{
                
                Text("Marinas")
                Spacer()
                Text("\(ports.count)")
            }
            HStack{
                Text("https://slipways.de")
                    .onTapGesture {
                        let url = URL(string: "https://slipways.de?origin=application")!
                        UIApplication.shared.open(url)
                        
                }.foregroundColor(.accentColor)
            }.padding(.vertical)
            Spacer()
            Text("Donate a beer")
                .onTapGesture {
                    if let uri = URL(string: "https://paypal.me/MBenders/2"){
                        UIApplication.shared.open(uri)
                    }   
            }.foregroundColor(.accentColor)
            Text("Copyright 2020 - Marcel Benders")
        }
        .font(.custom("Exo2-Regular", size: 22))
        .padding()
        .navigationBarTitle("Info")
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
