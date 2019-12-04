//
//  StationListView.swift
//  Slipways
//
//  Created by Marcel Benders on 18.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI

struct StationListView: View {
    @ObservedObject var stationViewModel: StationViewModel
    @EnvironmentObject var dataStore: DataStore
    @State var search: String
    
    var body: some View {
        List{
            HStack{
                TextField("Suche", text: $search)
                Image(systemName: "magnifyingglass")
            }
            
            ForEach(dataStore.stations) { station in
                if station.longname.starts(with: self.search.uppercased()) {
                    NavigationLink(destination: StationDetailsView(stationViewModel: StationViewModel(), station: station, value: "")) {
                        Text(station.name).font(.custom("Exo2-Regular", size: 22))
                    }   
                }
            }
        }.navigationBarTitle("Stationen")
    }
}


struct StationListView_Previews: PreviewProvider {
    static var previews: some View {
        StationListView(stationViewModel: StationViewModel.shared, search: "").environmentObject(DataStore.shared)
    }
}
