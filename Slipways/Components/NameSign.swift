//
//  NameSign.swift
//  Slipways
//
//  Created by Marcel Benders on 31.10.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI

struct NameSign: View {
    @EnvironmentObject var dataStore: DataStore
    var slipway: Slipway
    var db = AppData()
    @State var isFav: Bool
    
    var slipwayIndex: Int {
        dataStore.slipways.firstIndex(where: { $0.id == slipway.id })!
    }
    
    var body: some View {
        HStack{
            Text(slipway.name)
                .font(.subheadline)
            
            Button(action: {
                let tmpSlipwayDb = self.db.getSlipwayById(id: self.slipway.id)
                if let safe = tmpSlipwayDb{
                    self.db.updateSlipway(id: self.slipway.id, value: !safe.isFavorite)
                    self.dataStore.slipways[self.slipwayIndex].isFavorite = !safe.isFavorite
                }else{
                    self.db.updateSlipway(id: self.slipway.id, value: true)
                    self.dataStore.slipways[self.slipwayIndex].isFavorite = true
                }
            })
            {
                if self.dataStore.slipways[self.slipwayIndex].isFavorite ?? false{
                    Image(systemName: "star.fill").foregroundColor(Color.yellow)
                }else{
                    Image(systemName: "star").foregroundColor(Color.gray)
                }
            }
        }
        .padding(10)
        .overlay(Rectangle().stroke(Color.blue, lineWidth: 4))
        .shadow(radius: 12)
    }
}

struct NameSign_Previews: PreviewProvider {
    static var previews: some View {
        return NameSign(slipway: FakeData().slipway, isFav: false).environmentObject(DataStore.shared)
    }
}
