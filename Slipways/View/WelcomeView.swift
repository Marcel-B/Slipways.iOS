//
//  WelcomeView.swift
//  Slipways
//
//  Created by Marcel Benders on 18.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                HStack{
                    NavigationLink(destination: StationListView()) {
                        Text("Stationen")
                    }
                    
                    NavigationLink(destination: WaterListView()){
                        Text("Gewässer")
                    }
                    
                }.padding()
                
                HStack{
                    NavigationLink(destination: SlipwayList().environmentObject(UserData())
                    
                    ){
                        Text("Slipanlagen")
                    }
                }.padding()
                Spacer()
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
