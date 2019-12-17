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
    
    let station: StationQl
    var value: String = ""
    
    var body: some View {
        VStack{
            MapWrapperView(coordinate: CLLocationCoordinate2D (latitude: station.latitude, longitude: station.longitude), targetName: station.name)
                .frame(height: 320)
                .padding(.horizontal)
            List {
                Text("Pegelname: \(station.name)")
                Text("Wasserstr- & Schifffahrtsamt: \(station.fAgency)")
                Text("Nummer: \(station.number)")
//                Text("Gewässer: \(station.water.name)")
                Text(stationViewModel.pegel == nil ? "" : "Pegel: \(stationViewModel.pegel ?? "")")
            }
        }.onAppear{
            self.stationViewModel.pegel(id: self.station.id, completion: { (value) in
            })
        }.navigationBarTitle(Text(station.name), displayMode: .inline)
    }
}

struct StationDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        StationDetailsView(stationViewModel: StationViewModel(), station: FakeData.station, value: "").environmentObject(DataStore.shared)
    }
}
