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
    var coordinates: [CLLocationCoordinate2D]
    var overview: Bool = false
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        let annotations = coordinates.map { location -> MKAnnotation in
            let annotation = MKPointAnnotation()
            // annotation.title = location.title
            annotation.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
            return annotation
        }
        
        view.addAnnotations(annotations)
        var span: MKCoordinateSpan
        var region: MKCoordinateRegion
        
        if overview {
            span = MKCoordinateSpan(latitudeDelta: 11, longitudeDelta: 11)
            let center = CLLocationCoordinate2D(latitude: 50.078596, longitude: 9.448537)
            region = MKCoordinateRegion(center: center, span: span)
        }else{
            span = MKCoordinateSpan(latitudeDelta: 0.004, longitudeDelta: 0.004)
            region = MKCoordinateRegion(center: coordinates.first!, span: span)
            view.mapType = MKMapType.satellite
        }
        
        view.setRegion(region, animated: true)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MapView(coordinates: [CLLocationCoordinate2D(latitude: 2, longitude: 2)], overview: true)
                .previewLayout(.sizeThatFits)
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
                .previewDisplayName("iPhone SE")
            
            MapView(coordinates: [CLLocationCoordinate2D(latitude: 2, longitude: 2)], overview: true)
                .previewLayout(.sizeThatFits)
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
            
            MapView(coordinates: [CLLocationCoordinate2D(latitude: 2, longitude: 2)], overview: true)
                .previewLayout(.sizeThatFits)
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .previewDisplayName("iPhone XS Max")
        }
    }
}
