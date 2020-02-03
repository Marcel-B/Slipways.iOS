//
//  StationDetailsView.swift
//  Slipways
//
//  Created by Marcel Benders on 18.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI
import CoreLocation

struct StationDetailsView: View {
    var stationViewModel: StationViewModel
    var value: String = ""
    
    var body: some View {
        ScrollView{
            MapWrapperView(coordinates: stationViewModel.locationCoordinates, targetName: stationViewModel.name)
                .frame(height: 320)
                .padding(.horizontal)
            StationInfoView(viewModel: StationInfoViewModel(stationViewModel.station))
                .padding(.horizontal)
            Spacer()
        }
        .navigationBarTitle(stationViewModel.name)
    }
}

struct StationDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        StationDetailsView(stationViewModel: StationViewModel(Station()))
    }
}
