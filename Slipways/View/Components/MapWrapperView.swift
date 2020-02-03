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
    var coordinates: [CLLocationCoordinate2D]
    var targetName: String
    
    var body: some View {
        VStack{
            MapView(coordinates: coordinates)
            
            Button(action: {
                let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: self.getCoordinate()))
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
    
    func getCoordinate() -> CLLocationCoordinate2D {
        if let coordinate = coordinates.first{
            return coordinate
        }
        return CLLocationCoordinate2D()
    }
}

struct MapWrapperView_Previews: PreviewProvider {
    static var previews: some View {
        MapWrapperView(coordinates: [ CLLocationCoordinate2D(latitude: 2, longitude: 2)], targetName: "Essen")
    }
}
