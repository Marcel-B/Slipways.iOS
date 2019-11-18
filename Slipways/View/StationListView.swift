//
//  StationListView.swift
//  Slipways
//
//  Created by Marcel Benders on 18.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI

struct StationListView: View {
    @ObservedObject var stationService = SlipwayService()
    
    var body: some View {
        List(stationService.stations){ station in
            Text(station.longname)
        }.navigationBarTitle("Stationen").onAppear(){
            self.stationService.loadStations()
        }
    }
}

struct StationListView_Previews: PreviewProvider {
    static var previews: some View {
        StationListView()
    }
}
