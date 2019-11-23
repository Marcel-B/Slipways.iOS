//
//  WaterListView.swift
//  Slipways
//
//  Created by Marcel Benders on 17.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI

struct WaterListView: View {
    @ObservedObject var dataStore = DataStore.shared
    @State var search: String
    
    var body: some View {
        VStack {
            HStack{
                TextField("Suche", text: $search)
                Image(systemName: "magnifyingglass")
            }.padding()
            
            List(dataStore.getWaters(filter: self.search)){ water in
                NavigationLink(destination: WaterDetailsView(water: water)) {
                    Text(water.longname)
                }
            }.navigationBarTitle("Gewässer")
        }
    }
}

struct WaterListView_Previews: PreviewProvider {
    static var previews: some View {
        WaterListView(search: "")
    }
}
