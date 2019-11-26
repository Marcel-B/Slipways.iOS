//
//  StationDetailsView.swift
//  Slipways
//
//  Created by Marcel Benders on 18.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI
import CoreLocation

struct StationDetailsView: View {
    @EnvironmentObject var dataStore: DataStore
    let service: HttpService<CurrentMeasurementResponse>
    let station: Station
    var value: String
    
    var body: some View {
        VStack {
            MapView(coordinate: CLLocationCoordinate2D (latitude: station.latitude, longitude: station.longitude))
                .frame(height: 450)
                .padding(.top, -40)
            
            HStack{
                Text("pegelname")
                    .font(.footnote)
                Spacer()
                Text(station.longname)
            }.padding()
            
            HStack{
                Text("wasserstr- & schifffahrtsamt").font(.footnote)
                Spacer()
                Text(station.agency)
            }.padding()
            
            HStack{
                Text("nummer").font(.footnote)
                Spacer()
                Text(station.number)
            }.padding()
            
            HStack{
                Text("gewässer").font(.footnote)
                Spacer()
                Text(station.water.longname)
            }.padding()
            
            HStack{
                Text("pegel").font(.footnote)
                Spacer()
                Text(dataStore.pegel ?? "n")
            }.padding()
            Spacer()
        }
        .onAppear{
            self.dataStore.getPegel(id: self.station.id)
        }
    }
}

struct StationDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        StationDetailsView(service: HttpService<CurrentMeasurementResponse>(), station: FakeData().station, value: "").environmentObject(DataStore.shared)
    }
}
