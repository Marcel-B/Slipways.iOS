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
    
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: WaterListView()) {
                    Text("Waters")
                }
                
                List{
                    ForEach(userData.slipways) { slipway in
                        NavigationLink(destination: SlipwayDetails(slipway: slipway).environmentObject(self.userData) ){
                            SlipwayRow(slipway: slipway)
                        }
                    }
                }
                .navigationBarTitle("Slipanlagen")
            }
        }
    }
}

struct SlipwayList_Previews: PreviewProvider {
    static var previews: some View {
        SlipwayList()
    }
}
