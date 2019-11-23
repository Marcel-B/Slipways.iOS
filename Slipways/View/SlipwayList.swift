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
    @ObservedObject var dataStore = DataStore.shared
    @State var showFavoritesOnly = true
    
    var body: some View {
        List{
            Toggle(isOn: $showFavoritesOnly){
                Text("Favoriten anzeigen")
            }
            ForEach(dataStore.getSlipways()){ slipway in
                if !self.showFavoritesOnly || slipway.isFavorite ?? false {
                    NavigationLink(destination: SlipwayDetails(slipway: slipway)
                        .environmentObject(self.userData) ){
                        SlipwayRow(slipway: slipway)
                    }
                }
            }
        }.onAppear(perform: {
            print("List appears")
        })
        .navigationBarTitle("Slipanlagen")
    }
}

struct SlipwayList_Previews: PreviewProvider {
    static var previews: some View {
        SlipwayList()
    }
}
