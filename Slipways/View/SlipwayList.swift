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
    
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: WaterListView()) {
                    Text("Gewässer")
                }
                
                List{
                    Toggle(isOn: $showFavoritesOnly){
                        Text("Favoriten anzeigen")
                    }
                    ForEach(userData.slipways){ slipway in
                        if !self.showFavoritesOnly || slipway.isFavorite{
                            NavigationLink(destination: SlipwayDetails(slipway: slipway).environmentObject(self.userData) ){
                                SlipwayRow(slipway: slipway)
                            }
                        }
                    }
                }.navigationBarTitle("Slipanlagen")
            }
        }
    }
}

struct SlipwayList_Previews: PreviewProvider {
    static var previews: some View {
        SlipwayList()
    }
}
