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
    let slipwayViewModel = SlipwayViewModel()
    
    var body: some View {
        List{
            // TODO: Check Toggle is really needed dynamically
            if self.slipwayViewModel.hasFavorites(){
                Toggle(isOn: $baseDataStore.showFavoritesOnly){
                    Text("Favoriten anzeigen")
                }
            }
        
            ForEach(baseDataStore.data.slipways){ slipway in
                if !self.baseDataStore.showFavoritesOnly || slipway.isFavorite ?? false {
                    NavigationLink(destination: SlipwayDetails(slipway: slipway)
                        .environmentObject(self.baseDataStore)){
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
