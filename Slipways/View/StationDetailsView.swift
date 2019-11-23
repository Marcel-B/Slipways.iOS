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
    @ObservedObject var dataStore = DataStore()
    let station: Station
    
    var body: some View {
        VStack {
            MapView(coordinate: CLLocationCoordinate2D (latitude: station.latitude, longitude: station.longitude))
                .frame(height: 450)
                .padding(.top, -40)
            
            HStack{
                Text("Pegelname")
                    .font(.footnote)
                Spacer()
                Text(station.longname)
            }.padding()
            
            HStack{
                Text("Wasserstr- & Schifffahrtsamt").font(.footnote)
                Spacer()
                Text(station.agency)
            }.padding()
            
            HStack{
                Text("Nummer").font(.footnote)
                Spacer()
                Text(station.number)
            }.padding()
            
            HStack{
                Text("Gewässer").font(.footnote)
                Spacer()
                Text(station.water.longname)
            }.padding()
            
            HStack{
                Text("Pegel").font(.footnote)
                Spacer()
//                Text("\(slipwayService.single?.pegel ?? "")")
            }.padding()
            Spacer()
        }
//        .onAppear{self.slipwayService.fetchSingleData(link: Links().pegel(station: self.station.id))
//        }
    }
}

struct StationDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        StationDetailsView(station: Station(id: "1", number: "123", shortname: "foo", longname: "foobar", km: 2.22, agency: "hello", longitude: 2.2, latitude: 2.2, waterFk: "0815", water: Water(id: "kk", shortname: "foo", longname: "foobar")))
    }
}
