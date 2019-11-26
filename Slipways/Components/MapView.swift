//
//  MapView.swift
//  Slipways
//
//  Created by Marcel Benders on 31.10.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    var coordinate: CLLocationCoordinate2D
    
     func makeUIView(context: Context) -> MKMapView {
         MKMapView(frame: .zero)
     }
     
     func updateUIView(_ view: MKMapView, context: Context) {
         let span = MKCoordinateSpan(latitudeDelta: 0.004, longitudeDelta: 0.004)
         view.mapType = MKMapType.satellite
         let region = MKCoordinateRegion(center: coordinate, span: span)
         view.setRegion(region, animated: true)
     }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: FakeData().slipway.locationCoordinate)
    }
}
