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
    @State var search =  ""
    
    var body: some View {
        List{
            HStack{
                TextField("Suche", text: $search)
                Image(systemName: "magnifyingglass")
            }
            
            HStack{
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
                Spacer()
                Text("Favoriten")
                    .font(.title)
                Spacer()
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }
            
            Group{
                ForEach(baseDataStore.data.slipways){ slipway in
                    if slipway.favorite{
                        if self.search.count == 0{
                            NavigationLink(destination: SlipwayDetails(slipway: slipway)
                                .environmentObject(self.baseDataStore)){
                                    SlipwayRow(slipway: slipway)
                            }
                        }else if slipway.city.lowercased().contains(self.search.lowercased()) ||
                            slipway.name.lowercased().contains(self.search.lowercased())||slipway.water.name.lowercased().contains(self.search.lowercased()){
                            NavigationLink(destination: SlipwayDetails(slipway: slipway)
                                .environmentObject(self.baseDataStore)){
                                    SlipwayRow(slipway: slipway)
                            }
                        }
                    }
                }
            }
            HStack{
                Spacer()
                Text("Sonstige")
                    .font(.title)
                Spacer()
            }
            Group{
                 ForEach(baseDataStore.data.slipways){ slipway in
                              if !slipway.favorite{
                                  if self.search.count == 0{
                                      NavigationLink(destination: SlipwayDetails(slipway: slipway)
                                          .environmentObject(self.baseDataStore)){
                                              SlipwayRow(slipway: slipway)
                                      }
                                  }else if slipway.city.lowercased().contains(self.search.lowercased()) ||
                                      slipway.name.lowercased().contains(self.search.lowercased())||slipway.water.name.lowercased().contains(self.search.lowercased()){
                                      NavigationLink(destination: SlipwayDetails(slipway: slipway)
                                          .environmentObject(self.baseDataStore)){
                                              SlipwayRow(slipway: slipway)
                                      }
                                  }
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
