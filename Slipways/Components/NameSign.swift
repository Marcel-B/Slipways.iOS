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
    var slipway: Slipway
    @State var isFav: Bool
    
    var body: some View {
        HStack{
            
            Text(slipway.name)
                .font(.subheadline)
            
            Button(action: {
                let realm = try! Realm()
                var slip = realm.objects(SlipwayDb.self).filter("id == '\(self.slipway.id)'").first
                
                // Create slipway if not exists
                if(slip == nil){
                    slip = SlipwayDb()
                    slip?.id = self.slipway.id
                    try! realm.write {
                        realm.add(slip!)
                    }
                }
                
                slip = realm.objects(SlipwayDb.self).filter("id == '\(self.slipway.id)'").first
                
                if let tmp = slip{
                    try! realm.write{
                        tmp.isFavorite.toggle()
                        self.isFav = tmp.isFavorite
                    }
                }
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
        }
    }
    
    struct NameSign_Previews: PreviewProvider {
        static var previews: some View {
            return NameSign(slipway: FakeData().slipway, isFav: false)
        }
}
