//
//  SlipwayRow.swift
//  Slipways
//
//  Created by Marcel Benders on 05.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI

struct SlipwayRow: View {
    let viewModel: SlipwayRowViewModel
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        VStack{
            HStack{
                Text(viewModel.name)
                    .font(.custom("Exo2-Regular", size: 22))
                Spacer()
                if viewModel.favorite {
                    Image(systemName: "star.fill")
                        .imageScale(.medium)
                        .foregroundColor(.yellow)
                }
            }
            
            HStack{
                if Int(truncating: viewModel.rawCosts) > 0 {
                    Image(self.colorScheme == .light ? "dollar54Light" : "dollar54Dark")
                        .imageScale(.medium)
                }else if Int(truncating: viewModel.rawCosts) < 0 {
                    Image(self.colorScheme == .light ? "sad54Light" : "sad54Dark")
                        .imageScale(.medium)
                }else{
                    Image(self.colorScheme == .light ? "happy54Light" : "happy54Dark")
                        .imageScale(.medium)
                }
                if (viewModel.camping){
                    Image(self.colorScheme == .light ? "camping54Light" :  "camping54Dark")
                }
                
                if (viewModel.parking){
                    Image(self.colorScheme == .light ? "parking54Light" :  "parking54Dark")
                }
                
                if (viewModel.pier){
                    Image(self.colorScheme == .light ? "pier54Light" :  "pier54Dark")
                }
                if (viewModel.hasPort){
                    Image(self.colorScheme == .light ? "anchor54Light" :  "anchor54Dark")
                }
                Spacer()
            }
            
            HStack{
                Image(viewModel.getCountry())
                Text(viewModel.city)
                    .font(.footnote)
                Spacer()
                Text(viewModel.water)
                    .font(.footnote)
            }
        }
    }
}

struct SlipwayRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {  
            SlipwayRow(viewModel: SlipwayRowViewModel(FakeData.getSlipway()))
                .previewLayout(.sizeThatFits)
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
                .previewDisplayName("iPhone SE")
            
            SlipwayRow(viewModel: SlipwayRowViewModel(FakeData.getSlipway()))
                .previewLayout(.sizeThatFits)
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
            
            SlipwayRow(viewModel: SlipwayRowViewModel(FakeData.getSlipway()))
                .previewLayout(.sizeThatFits)
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .previewDisplayName("iPhone XS Max")
        }
    }
}
