//
//  ButtonLineView.swift
//  Slipways
//
//  Created by Marcel Benders on 29.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI
import MapKit

struct ButtonLineView: View {
    @EnvironmentObject var dataStore: DataStore
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var slipway: SlipwayQl
    var db = AppData()
    
    var slipwayIndex: Int {
        dataStore.data.slipways.firstIndex(where: { $0.id == slipway.id })!
    }
    let buttonSize: CGFloat = 30.0
    
    var body: some View {
        HStack{
            Button(action: {
                let tmpSlipwayDb = self.db.getSlipwayById(id: self.slipway.id)
                if let safe = tmpSlipwayDb{
                    self.db.updateSlipway(id: self.slipway.id, value: !safe.isFavorite)
                    self.dataStore.data.slipways[self.slipwayIndex].isFavorite = !safe.isFavorite
                }else{
                    self.db.updateSlipway(id: self.slipway.id, value: true)
                    self.dataStore.data.slipways[self.slipwayIndex].isFavorite = true
                }
            }) {
                if self.dataStore.data.slipways[self.slipwayIndex].favorite {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: buttonSize, height: buttonSize, alignment: .leading)
                        .foregroundColor(Color.yellow)
                }else{
                    Image(systemName: "star")
                        .resizable()
                        .frame(width: buttonSize, height: buttonSize, alignment: .leading)
                        .foregroundColor(Color.gray)
                }
            }
            
            Spacer()
            
            if slipway.extras.contains(where: { (extra) -> Bool in
                extra.name == "Campingplatz"
            }){
                Image(self.colorScheme == .light ? "camping96Light" :  "camping96Dark")
                Spacer()
            }
            
            if slipway.extras.contains(where: { (extra) -> Bool in
                extra.name == "Parkplatz"
            }){
                Image(self.colorScheme == .light ? "parking96Light" :  "parking96Dark")
                Spacer()
                
            }
            if slipway.extras.contains(where: { (extra) -> Bool in
                        extra.name == "Steg"
                    }){
                        Image(self.colorScheme == .light ? "pier96Light" :  "pier96Dark")
                        Spacer()
                        
                    }
            
            Button(action: {
                let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: self.slipway.locationCoordinate))
                mapItem.name = self.slipway.name
                mapItem.openInMaps(launchOptions:  [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving])
            }) {
                Image(systemName: "car")
                    .resizable()
                    .frame(width: buttonSize - 2, height: buttonSize - 5, alignment: .trailing)
            }
        }
    }
}

struct ButtonLineView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonLineView(slipway: FakeData.slipway)
            .previewLayout(.sizeThatFits)
            .environmentObject(DataStore.shared)
    }
}
