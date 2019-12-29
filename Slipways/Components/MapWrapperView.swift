//
//  MapWrapperView.swift
//  Slipways
//
//  Created by Marcel Benders on 29.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI
import MapKit

struct MapWrapperView: View {
    var coordinate: CLLocationCoordinate2D
    var targetName: String
    
    var body: some View {
        VStack{
            MapView(coordinate: coordinate)
            
            Button(action: {
                let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: self.coordinate))
                mapItem.name = self.targetName
                mapItem.openInMaps(launchOptions:  [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving])
            }) {
                HStack{
                    Spacer()
                    Image(systemName: "car")
                        .padding(.vertical)
                }
            }
        }
    }
}

struct MapWrapperView_Previews: PreviewProvider {
    static var previews: some View {
        MapWrapperView(coordinate: FakeData.slipway.locationCoordinate, targetName: "Essen")
    }
}
