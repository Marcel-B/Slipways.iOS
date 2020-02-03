//
//  WaterListView.swift
//  Slipways
//
//  Created by Marcel Benders on 17.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI

struct WaterListView: View {
    @FetchRequest(entity: Water.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Water.name, ascending: true)]) var waters: FetchedResults<Water>
    @State var search: String = ""
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        List{
            
            HStack{
                TextField("Search", text: $search)
                Image(systemName: "magnifyingglass")
            }

            ForEach(self.waters.filter({ water in self.search(water.name) }), id: \.self.id!) { water in
                NavigationLink(destination: WaterDetailsView(water: water)) {
                    VStack{
                        HStack{
                            Text(water.name ?? "n/a")
                                .font(.custom("Exo2-Regular", size: 22))
                            Spacer()
                        }
                        HStack{
                            Spacer()
                            Text(water.station == nil ? "n/a" : "\(water.station!.allObjects.count)")
                            Image(self.colorScheme == .light ? "ruler" : "rulerDarkMode")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20.0, height: 20.0)
                        }
                    }
                }
            }.navigationBarTitle("Waters", displayMode: .large)
        }
    }
    
    func search(_ value: String?) -> Bool {
        if let name = value{
            if name.starts(with: self.search.uppercased()) {
                return true
            }
        }
        return false
    }
}

struct WaterListView_Previews: PreviewProvider {
    static var previews: some View {
        WaterListView()
    }
}
