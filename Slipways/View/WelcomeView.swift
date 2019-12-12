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
                HStack{
                    Spacer()
                    NavigationLink(destination: SlipwayList().environmentObject(self.dataStore)){
                        Image("launch")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100.0, height: 100.0)
                    }
                    Spacer()
                }
                HStack{
                    Spacer()
                    NavigationLink(destination: StationListView(stationViewModel: StationViewModel.shared, search: "")) {
                        Image("ruler")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100.0, height: 100.0)
                    }
                    Spacer()
                    NavigationLink(destination: WaterListView(search: "")){
                        Image("waves")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100.0, height: 100.0)
                    }
                    Spacer()
                }.padding()
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView().environmentObject(DataStore.shared)
    }
}
