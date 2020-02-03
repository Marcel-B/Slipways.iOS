//
//  PortListView.swift
//  Slipways
//
//  Created by Marcel Benders on 27.01.20.
//  Copyright © 2020 Marcel Benders. All rights reserved.
//

import SwiftUI

struct PortListView: View {
    @FetchRequest(entity: Port.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Port.name, ascending: true)]) var ports: FetchedResults<Port>
    @State var search: String = ""
    
    var body: some View {
        List{
            HStack{
                TextField("Search", text: $search)
                Image(systemName: "magnifyingglass")
            }
            ForEach(self.ports.filter({b in self.input(b)}), id: \.self) { port in
                NavigationLink(destination: PortDetailsView(port: port)){
                    PortRow(viewModel: PortRowViewModel(port))
                }
            }
        }.navigationBarTitle("Marinas", displayMode: .large)
    }
    
    func input(_ value: Port) -> Bool{
        let search = self.search.uppercased()
        if search == "" {
            return true
        }
        if let name = value.name {
            if name.uppercased().starts(with: search) {
                return true
            }
        }
        if let water = value.water{
            if let name = water.name{
                if name.uppercased().starts(with: search){
                    return true
                }
            }
        }
        if let city = value.city {
            if city.uppercased().starts(with: search){
                return true
            }
        }
        return false
    }
}

struct PortListView_Previews: PreviewProvider {
    static var previews: some View {
        PortListView()
    }
}
