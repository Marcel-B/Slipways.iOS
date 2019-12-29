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
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        List{
            
            HStack{
                TextField("Suche", text: $search)
                Image(systemName: "magnifyingglass")
            }
            
            ForEach(dataStore.data.waters) { water in
                if water.longname
                    .starts(with: self.search.uppercased()) {
                    
                    NavigationLink(destination: WaterDetailsView(water: water)) {
                        VStack{
                            HStack{
                                Text(WaterViewModel.formatName(water: water.name))
                                    .font(.custom("Exo2-Regular", size: 22))
                                Spacer()
                            }
                            HStack{
                                Spacer()
                                Text(water.stations?.count == nil ? "n/a" : "\(water.stations!.count)")
                                Image(self.colorScheme == .light ? "ruler" : "rulerDarkMode")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20.0, height: 20.0)
                            }
                        }
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
