//
//  WelcomeView.swift
//  Slipways
//
//  Created by Marcel Benders on 18.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var dataStore: DataStore
    var body: some View {
        
        NavigationView{
            VStack{
                Spacer()
                NavigationLink(destination: SlipwayList().environmentObject(self.dataStore)){
                    HStack{
                        Text("Slipanlagen")
                            .font(.system(size: 42))
                    }
                }.padding()
                
                NavigationLink(destination: StationListView(stationViewModel: StationViewModel.shared, search: "")) {
                    Text("Stationen")
                        .font(.system(size: 42))
                    
                }.padding()
                
                NavigationLink(destination: WaterListView(search: "")){
                    Text("Gewässer")
                        .font(.system(size: 42))
                }.padding()
                
                Spacer()
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView().environmentObject(DataStore.shared)
    }
}
