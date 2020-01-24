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
    @State var search: String
    
    var body: some View {
        List{
            HStack{
                TextField("Suche", text: $search)
                Image(systemName: "magnifyingglass")
            }
            ForEach(stations, id: \.self.id!) { station in
//                    if station.name.starts(with: self.search.uppercased()) {
                        NavigationLink(destination: StationDetailsView(stationViewModel: StationViewModel(), station: station, value: "")) {
                            Text(station.name ?? "n/a").font(.custom("Exo2-Regular", size: 22))
                        }
//                }
            }
        }.navigationBarTitle("Stationen")
    }
}


struct StationListView_Previews: PreviewProvider {
    static var previews: some View {
        StationListView(search: "")
    }
}
