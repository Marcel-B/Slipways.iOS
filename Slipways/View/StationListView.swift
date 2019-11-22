//
//  StationListView.swift
//  Slipways
//
//  Created by Marcel Benders on 18.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI

struct StationListView: View {
    @ObservedObject var dataStore = DataStore()
    @State var input: String
    
    var body: some View {
        
        return VStack{
            HStack{
                TextField("Suche", text: $input)
                Image(systemName: "magnifyingglass")
            }.padding()
            
            //            List(dataStore.stations){ station in
            List(dataStore.getStations()){ station in
                
                NavigationLink(destination: StationDetailsView(station: station)){
                    Text(station.longname)
                }
            }.navigationBarTitle("Stationen")
            //                .onAppear(){
            //                self.dataStore.getStations()
            //            }
        }
    }
}

struct StationListView_Previews: PreviewProvider {
    static var previews: some View {
        StationListView(input: "")
    }
}
