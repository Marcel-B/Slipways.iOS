//
//  ContentView.swift
//  Slipways
//
//  Created by Marcel Benders on 31.10.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI

struct SlipwayList: View {
    @EnvironmentObject var baseDataStore: DataStore
    
    var body: some View {
        List{
            Toggle(isOn: $baseDataStore.showFavoritesOnly){
                Text("Favoriten anzeigen")
            }
            
            ForEach(baseDataStore.getSlipways()){ slipway in
                if !self.baseDataStore.showFavoritesOnly || slipway.isFavorite ?? false {
                    NavigationLink(destination: SlipwayDetails(slipway: slipway).environmentObject(self.baseDataStore)){
                        SlipwayRow(slipway: slipway)
                    }
                }
            }
        }.navigationBarTitle("Slipanlagen")
    }
}

struct SlipwayList_Previews: PreviewProvider {
    static var previews: some View {
        SlipwayList().environmentObject(DataStore.shared)
    }
}
