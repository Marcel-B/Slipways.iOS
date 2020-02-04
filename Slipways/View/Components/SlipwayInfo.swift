//
//  SlipwayInfo.swift
//  Slipways
//
//  Created by Marcel Benders on 31.10.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI

struct SlipwayInfo: View {
    let viewModel: SlipwayInfoViewModel
    
    var body: some View {
        VStack{
            
            HStack {
                Text("Street")
                    + Text(": ")
                    + Text(viewModel.street)
                Spacer()
            }.padding(.top)
            HStack {
                Text("City / Town")
                    + Text(": ")
                    + Text(viewModel.city)
                
                Spacer()
            }.padding(.top)
            
            HStack {
                Text("PLZ")
                    + Text(": ")
                    + Text(viewModel.postalcode)
                Spacer()
            }.padding(.top)
            HStack {
                Text("Costs")
                    + Text(": ")
                    + Text(viewModel.costs)
                Spacer()
            }.padding(.top)
            
            HStack{
                
                Text("Water")
                    + Text(": ")
                    + Text(viewModel.water)
                Image(systemName: "w.square")
                    .foregroundColor(.accentColor)
                    .onTapGesture {
                        let urlStr = "https://de.wikipedia.org/wiki/\(self.viewModel.water)"
                        if let uri = URL(string: urlStr){
                            UIApplication.shared.open(uri)
                        }
                }
                Spacer()
            }
        }
    }
}

struct SlipwayInfo_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SlipwayInfo(viewModel: SlipwayInfoViewModel(FakeData.getSlipway()))
                .previewLayout(.sizeThatFits)
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
                .previewDisplayName("iPhone SE")
            
            SlipwayInfo(viewModel: SlipwayInfoViewModel(FakeData.getSlipway()))
                .previewLayout(.sizeThatFits)
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
            
            SlipwayInfo(viewModel: SlipwayInfoViewModel(FakeData.getSlipway()))
                .previewLayout(.sizeThatFits)
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .previewDisplayName("iPhone XS Max")
        }
    }
}
