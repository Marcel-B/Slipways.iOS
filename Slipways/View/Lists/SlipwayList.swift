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
    @State var search =  ""
    
    var body: some View {
        List{
            HStack{
                TextField("Search", text: $search)
                Image(systemName: "magnifyingglass")
            }
            
            HStack{
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
                Spacer()
                Text("Favorites")
                    .font(.title)
                Spacer()
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }
            
            Group{
                ForEach(slipways.filter({ slipway in self.match(slipway) })){ slipway in
                    ForEachBuilder{
                        if slipway.favorite{
                            NavigationLink(destination: SlipwayDetails(slipway: slipway)){
                                SlipwayRow(viewModel: SlipwayRowViewModel(slipway))
                            }
                        }
                    }
                }
            }
            HStack{
                Spacer()
                Text("Others")
                    .font(.title)
                Spacer()
            }
            Group{
                ForEach(slipways.filter({ slipway in self.match(slipway) }), id: \.self){ slipway in
                    ForEachBuilder{
                        if !slipway.favorite{
                            NavigationLink(destination: SlipwayDetails(slipway: slipway)){
                                SlipwayRow(viewModel: SlipwayRowViewModel(slipway))
                            }
                        }
                    }
                }
            }
        }.navigationBarTitle("Slipways", displayMode: .large)
    }
    
    func match(_ slipway: Slipway) -> Bool {
        let search = self.search.uppercased()
        if search == "" {
            return true
        }
        if let name = slipway.name{
            if name.uppercased().starts(with: search){
                return true
            }
        }
        if let water = slipway.water {
            if let name = water.name {
                if name.uppercased().starts(with: search){
                    return true
                }
            }
        }
        if let city = slipway.city{
            if city.uppercased().starts(with: search){
                return true
            }
        }
        return false
    }
}

struct SlipwayList_Previews: PreviewProvider {
    static var previews: some View {
        SlipwayList()
    }
}
