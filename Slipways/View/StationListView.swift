//
//  StationListView.swift
//  Slipways
//
//  Created by Marcel Benders on 18.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI

struct StationListView: View {
    @ObservedObject var stationService = SlipwayService<Station>()
    
    var body: some View {
        List(stationService.data){ station in
            NavigationLink(destination: StationDetailsView(station: station)){
                Text(station.longname)
            }
        }.navigationBarTitle("Stationen").onAppear(){
            self.stationService.fetchData(link: Links().stations)
        }
    }
}

struct StationListView_Previews: PreviewProvider {
    static var previews: some View {
        StationListView()
    }
}
