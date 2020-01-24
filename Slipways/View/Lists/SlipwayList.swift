//
//  ContentView.swift
//  Slipways
//
//  Created by Marcel Benders on 31.10.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI

struct ForEachBuilder<Content>: View where Content: View {
    private let content: Content
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    var body: some View {
        content
    }
}

struct SlipwayList: View {
    @FetchRequest(entity: Slipway.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Slipway.name, ascending: true)]) var slipways: FetchedResults<Slipway>
//    let slipwayViewModel = SlipwayViewModel()
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
                ForEach(slipways, id: \.self){ slipway in
                    ForEachBuilder{
                        if slipway.favorite{
                            NavigationLink(destination: SlipwayDetails(slipway: slipway)){
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
                ForEach(slipways, id: \.self){ slipway in
                    ForEachBuilder{
                        if !slipway.favorite{
                            NavigationLink(destination: SlipwayDetails(slipway: slipway)){
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
        SlipwayList()
    }
}
