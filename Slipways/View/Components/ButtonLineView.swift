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
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @State var favorite: Bool
    
    var slipway: Slipway
    let buttonSize: CGFloat = 30.0
    
    var body: some View {
        HStack{
            Button(action: {
                self.slipway.favorite = !self.slipway.favorite
                self.favorite.toggle()
                do {
                    try self.managedObjectContext.save()
                } catch {
                    debugPrint("Error while saving state of slipway")
                    print(error)
                }
            }) {
                
                if self.favorite {
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
            
            if (slipway.extra?.allObjects as! [Extra]).contains(where: { (extra) -> Bool in
                extra.name == "Campingplatz"
            }){
                Image(self.colorScheme == .light ? "camping96Light" :  "camping96Dark")
                Spacer()
            }
            
            if (slipway.extra?.allObjects as! [Extra]).contains(where: { (extra) -> Bool in
                extra.name == "Parkplatz"
            }){
                Image(self.colorScheme == .light ? "parking96Light" :  "parking96Dark")
                Spacer()
            }
            
            if (slipway.extra?.allObjects as! [Extra]).contains(where: { (extra) -> Bool in
                extra.name == "Steg"
            }){
                Image(self.colorScheme == .light ? "pier96Light" :  "pier96Dark")
                Spacer()
            }
            
            if(slipway.port != nil) {
                NavigationLink(destination: PortDetailsView(port: slipway.port!)){
                    Image(self.colorScheme == .light ? "anchor96Light" :  "anchor96Dark")  
                }
                Spacer()
            }
            
            Button(action: {
                let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D (latitude: self.slipway.latitude, longitude: self.slipway.longitude)))
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
        let slipway = FakeData.getSlipway()
        return Group {
            ButtonLineView(favorite: false, slipway: slipway)
                .previewLayout(.sizeThatFits)
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
                .previewDisplayName("iPhone SE")
            
            ButtonLineView(favorite: false, slipway: slipway)
                .previewLayout(.sizeThatFits)
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
            
            ButtonLineView(favorite: false, slipway: slipway)
                .previewLayout(.sizeThatFits)
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .previewDisplayName("iPhone XS Max")
        }
    }
}
