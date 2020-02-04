//
//  StationInfoView.swift
//  Slipways
//
//  Created by Marcel Benders on 30.01.20.
//  Copyright © 2020 Marcel Benders. All rights reserved.
//

import SwiftUI

struct StationInfoView: View {
    @ObservedObject var viewModel: StationInfoViewModel
    
    var body: some View {
        VStack{
            HStack{
                Text("Gauge Name")
                    + Text(": ")
                    + Text(viewModel.name)
                Spacer()
            }
            HStack{
                Text("Waterways & Shipping Office")
                    + Text(": ")
                    + Text(viewModel.agency)
                Spacer()
            }
            HStack{
                Text("Number")
                    + Text(": ")
                    + Text(viewModel.number)
                Spacer()
            }
            HStack{
                Text("Water")
                    + Text(": ")
                    + Text(viewModel.water)
                Spacer()
            }
            HStack{
                Text("Level")
                    + Text(": ")
                    + Text(viewModel.pegel)
                Spacer()
            }
        }
        .onAppear{ self.viewModel.pegel(completion: { (value) in })
        }
    }
}

struct StationInfoView_Previews: PreviewProvider {
    static var previews: some View {
        let station = FakeData.getStation()
        
        return Group {            
            StationInfoView(viewModel: StationInfoViewModel(station))
                .previewLayout(.sizeThatFits)
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
                .previewDisplayName("iPhone SE")
            
            StationInfoView(viewModel: StationInfoViewModel(station))
                .previewLayout(.sizeThatFits)
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
            
            StationInfoView(viewModel: StationInfoViewModel(station))
                .previewLayout(.sizeThatFits)
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .previewDisplayName("iPhone XS Max")
        }
    }
}
