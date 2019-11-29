//
//  StationListView.swift
//  Slipways
//
//  Created by Marcel Benders on 18.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI

struct StationListView: View {
    @ObservedObject var dataStore = DataStore.shared
    @State var search: String
    
    var body: some View {
        
        return VStack{
            HStack{
                TextField("Suche", text: $search)
                Image(systemName: "magnifyingglass")
            }.padding()
            
            List(dataStore.getStations(filter: self.search)){ station in
                NavigationLink(destination: StationDetailsView(stationViewModel: StationViewModel(nil, nil), station: station, value: "")){
                    Text(station.longname)
                }
            }
        }.navigationBarTitle("Stationen")
    }
}

struct StationListView_Previews: PreviewProvider {
    static var previews: some View {
        StationListView(search: "")
    }
}
