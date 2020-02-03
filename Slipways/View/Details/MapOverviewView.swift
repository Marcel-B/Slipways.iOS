//
//  MapOverviewView.swift
//  Slipways
//
//  Created by Marcel Benders on 29.01.20.
//  Copyright © 2020 Marcel Benders. All rights reserved.
//

import SwiftUI
import MapKit
import CoreData

struct MapOverviewView: View {
    @FetchRequest(entity: Slipway.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Slipway.name, ascending: true)]) var slipways: FetchedResults<Slipway>
    
    var body: some View {
        MapView(coordinates: getCoordinates(), overview: true)
            .padding()
            .navigationBarTitle("Overview")
    }
    
    func getCoordinates() -> [CLLocationCoordinate2D]{
        var coordinates = [CLLocationCoordinate2D]()
        for slipway in slipways{
            coordinates.append(slipway.locationCoordinate())
        }
        return coordinates
    }
}

struct MapOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        MapOverviewView()
    }
}
