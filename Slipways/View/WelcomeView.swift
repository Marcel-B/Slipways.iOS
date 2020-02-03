//
//  WelcomeView.swift
//  Slipways
//
//  Created by Marcel Benders on 18.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI

extension View {
    
    public func currentDeviceNavigationViewStyle() -> AnyView {
        #if targetEnvironment(macCatalyst)
        return AnyView(self.navigationViewStyle(DefaultNavigationViewStyle()))
        #else
        return AnyView(self.navigationViewStyle(StackNavigationViewStyle()))
        #endif
        //        if UIDevice.current.userInterfaceIdiom == .pad {
        //            return AnyView(self.navigationViewStyle(StackNavigationViewStyle()))
        //        } else {
        //            return AnyView(self.navigationViewStyle(DefaultNavigationViewStyle()))
        //        }
    }
}

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
                        Image("boatLaunch360")
                    }
                    Spacer()
                }
                HStack{
                    Spacer()
                    NavigationLink(destination: PortListView()){
                        Image("anchor360")
                    }
                    Spacer()
                    NavigationLink(destination: ServiceView()){
                        Image("maintenance360")
                    }
                    Spacer()
                }
                HStack{
                    Spacer()
                    NavigationLink(destination: StationListView()) {
                        Image("ruler360")
                    }
                    Spacer()
                    NavigationLink(destination: WaterListView()){
                        Image("seaWaves360")
                    }
                    Spacer()
                }.padding()
                HStack{
                    Spacer()
                    NavigationLink(destination: MapOverviewView()){
                        Image("mapMarker360")
                    }
                    Spacer()
                    NavigationLink(destination: InfoView()){
                        Image("information360")
                    }
                    Spacer()
                }.padding()
                Spacer()
            }
                // .background(
                // LinearGradient(
                // gradient: Gradient(colors: [.secondary, .white, .secondary]),
                // startPoint: .leading,
                // endPoint: .trailing
                // ))
//                .edgesIgnoringSafeArea(.all)
                .navigationBarTitle("Slipways.de")
        }.currentDeviceNavigationViewStyle()
     
//            #if targetEnvironment(macCatalyst)
//                print("UIKit running on macOS")
//            #else
//
//            #endif
        
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
