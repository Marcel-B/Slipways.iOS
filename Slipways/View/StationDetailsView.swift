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
    let station: Station
    
    var body: some View {
        VStack {
            MapView(coordinate: CLLocationCoordinate2D (latitude: station.latitude, longitude: station.longitude))
            Text(station.longname)
            Text(station.agency)
            Text(station.number)
            
        }
    }
}

struct StationDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        StationDetailsView(station: Station(id: "1", number: "123", shortname: "foo", longname: "foobar", km: 2.22, agency: "hello", longitude: 2.2, latitude: 2.2, waterFk: "0815"))
    }
}
