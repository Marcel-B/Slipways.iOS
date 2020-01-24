//
//  WelcomeView.swift
//  Slipways
//
//  Created by Marcel Benders on 18.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI

struct WelcomeView: View {
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
    
    var body: some View {
        
        
//        RadialGradient(gradient: Gradient(colors: [.orange, .red]), center: .center, startRadius: 100, endRadius: 470)
        NavigationView{
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    NavigationLink(destination: SlipwayList()){
                        Image("launch")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100.0, height: 100.0)
                    }
                    Spacer()
                    NavigationLink(destination: ServiceView()){
                        Image("wrench100")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100.0, height: 100.0)
                    }
                    Spacer()
                }
                HStack{
                    Spacer()
                    NavigationLink(destination: StationListView(search: "")) {
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
                HStack{
                    Spacer()
                    NavigationLink(destination: InfoView()){
                        Image("info100Dark")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100.0, height: 100.0)
                    }
                    Spacer()
                }.padding()
                Spacer()
            }
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [.secondary, .white, .secondary]),
                    startPoint: .leading,
                    endPoint: .trailing
                ))
            .edgesIgnoringSafeArea(.all)
        }
    }
}


struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
