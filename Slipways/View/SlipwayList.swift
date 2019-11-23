//
//  ContentView.swift
//  Slipways
//
//  Created by Marcel Benders on 31.10.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI

struct SlipwayList: View {
    @EnvironmentObject private var userData: UserData
    @State var showFavoritesOnly = true
    @ObservedObject var dataStore = DataStore.shared
    
    var body: some View {
        List{
            Toggle(isOn: $showFavoritesOnly){
                Text("Favoriten anzeigen")
            }
            ForEach(dataStore.getSlipways()){ slipway in
//                if !self.showFavoritesOnly || slipway.isFavorite{
                    NavigationLink(destination: SlipwayDetails(slipway: slipway).environmentObject(self.userData) ){
                        SlipwayRow(slipway: slipway)
                    }
//                }
            }
        }.navigationBarTitle("Slipanlagen")
    }
}

struct SlipwayList_Previews: PreviewProvider {
    static var previews: some View {
        SlipwayList()
    }
}
