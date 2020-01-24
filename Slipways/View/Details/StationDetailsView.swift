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
    @ObservedObject var stationViewModel: StationViewModel
    let station: Station
    var value: String = ""
    
    var body: some View {
        VStack{
            MapWrapperView(coordinate: CLLocationCoordinate2D (latitude: station.latitude, longitude: station.longitude), targetName: station.name ?? "n/a")
                .frame(height: 320)
                .padding(.horizontal)
            List {
                Text("Pegelname: ")
                    + Text(station.name ?? "n/a")
                Text("Wasserstr- & Schifffahrtsamt: ")
                    + Text(station.agency ?? "n/a")
                Text("Nummer: ")
                    + Text(station.number ?? "n/a")
                Text("Gewässer: ")
                    + Text(station.water?.name ?? "n/a")
                Text(stationViewModel.pegel == nil ? "" : "Pegel: \(stationViewModel.pegel ?? "")")
            }
        }
        .onAppear{
            self.stationViewModel.pegel(id: "\(self.station.id!)", completion: { (value) in
            })
        }.navigationBarTitle(Text(station.name ?? "n/a"), displayMode: .inline)
    }
}

struct StationDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        StationDetailsView(stationViewModel: StationViewModel(), station: Station())
    }
}
