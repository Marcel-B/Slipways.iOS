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
    @ObservedObject var stationViewModel: StationViewModel
    
    let station: Station
    var value: String
    
    var body: some View {
        VStack {
            MapWrapperView(coordinate: CLLocationCoordinate2D (latitude: station.latitude, longitude: station.longitude), targetName: station.longname)
                .frame(height: 320)
            
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
                Text(stationViewModel.pegel ?? "-")
            }.padding()
            Spacer()
        }
        .onAppear{
            self.stationViewModel.pegel(id: self.station.id, completion: { (value) in
                print("\(value)")
            })
        }
    }
}

struct StationDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        StationDetailsView(stationViewModel: StationViewModel(nil, nil), station: FakeData().station, value: "").environmentObject(DataStore.shared)
    }
}
