//
//  StationListView.swift
//  Slipways
//
//  Created by Marcel Benders on 18.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI

struct StationListView: View {
    @FetchRequest(entity: Station.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Station.name, ascending: true)]) var stations: FetchedResults<Station>
    @State var search: String = ""
    
    var body: some View {
        List{
            HStack{
                TextField("Search", text: $search)
                Image(systemName: "magnifyingglass")
            }
            ForEach(stations.filter({ station in self.search(station.name)}), id: \.self.id!) { station in
                NavigationLink(destination: StationDetailsView(stationViewModel: StationViewModel(station))) {
                    Text(station.name ?? "n/a").font(.custom("Exo2-Regular", size: 22))
                }
            }
        }.navigationBarTitle("Stations", displayMode: .large)
    }
    
    func search(_ value: String?) -> Bool {
        if let name = value {
            if name.starts(with: self.search.uppercased()) {
                return true
            }
        }
        return false
    }
}

struct StationListView_Previews: PreviewProvider {
    static var previews: some View {
        StationListView()
    }
}
