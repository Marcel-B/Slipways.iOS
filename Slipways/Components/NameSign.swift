//
//  NameSign.swift
//  Slipways
//
//  Created by Marcel Benders on 31.10.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI
import RealmSwift

struct NameSign: View {
    var dataBase: DataBase
    var slipway: Slipway
    @State var isFav: Bool
    
    var body: some View {
        HStack{
            Text(slipway.name)
                .font(.subheadline)
            
            Button(action: {
                let fav = !self.isFav
                self.isFav.toggle()
                self.dataBase.updateSlipway(id: self.slipway.id, value: fav)
            })
            {
                if self.isFav{
                    Image(systemName: "star.fill").foregroundColor(Color.yellow)
                }else{
                    Image(systemName: "star").foregroundColor(Color.gray)
                }
            }
        }
        .padding(10)
        .overlay(Rectangle().stroke(Color.blue, lineWidth: 4))
        .shadow(radius: 12)
        .onAppear(){
            if let sl = self.dataBase.getSlipwayById(id: self.slipway.id){
                self.isFav = sl.isFavorite
            }
        }
    }
}

struct NameSign_Previews: PreviewProvider {
    static var previews: some View {
        return NameSign(dataBase: RealmBase(), slipway: FakeData().slipway, isFav: false)
    }
}
