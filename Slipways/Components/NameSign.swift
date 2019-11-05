//
//  NameSign.swift
//  Slipways
//
//  Created by Marcel Benders on 31.10.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI

struct NameSign: View {
    @EnvironmentObject var userData: UserData
    var slipway: Slipway
    
    var slipwayIndex: Int {
        userData.slipways.firstIndex(where: {$0.id == slipway.id })!
    }
    
    var body: some View {
        HStack{
            Text(slipway.name)
                .font(.subheadline)
            
            Button(action: {
                self.userData.slipways[self.slipwayIndex].isFavorite.toggle()
            }){
                if self.userData.slipways[self.slipwayIndex].isFavorite{
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
        let userData = UserData()
        return NameSign(slipway: userData.slipways[0])
            .environmentObject(userData)
    }
}
