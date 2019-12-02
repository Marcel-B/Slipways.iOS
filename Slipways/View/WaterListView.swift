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
    @State var search: String = ""
    
    var waterViewModel = WaterViewModel()
    
    var body: some View {
        List{
            HStack{
                TextField("Suche", text: $search)
                Image(systemName: "magnifyingglass")
            }
            
            ForEach(dataStore.waters){ water in
                if water.longname.starts(with: self.search.uppercased()) {
                    NavigationLink(destination: WaterDetailsView(water: water)) {
                        Text(WaterViewModel.formatName(water: water.name))
                    }
                }
            }.navigationBarTitle("Gewässer")
        }
    }
}

struct WaterListView_Previews: PreviewProvider {
    static var previews: some View {
        WaterListView()
    }
}
