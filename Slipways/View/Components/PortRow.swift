//
//  PortRow.swift
//  Slipways
//
//  Created by Marcel Benders on 30.01.20.
//  Copyright © 2020 Marcel Benders. All rights reserved.
//

import SwiftUI

struct PortRow: View {
    let viewModel: PortRowViewModel
    
    var body: some View {
        VStack{
            HStack{
                Text(viewModel.name)
                    .font(.custom("Exo2-Regular", size: 22))
                Spacer()
            }
            HStack{
                Image(systemName: "mappin.and.ellipse")
                    .imageScale(.small)
                Text(viewModel.city)
                Spacer()
                Text(viewModel.water)
            }
        }
    }
}

struct PortRow_Previews: PreviewProvider {
    static var previews: some View {
        let port = FakeData.getPort()
        return Group {
            PortRow(viewModel: PortRowViewModel(port))
                .previewLayout(.sizeThatFits)
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
                .previewDisplayName("iPhone SE")
            
            PortRow(viewModel: PortRowViewModel(port))
                .previewLayout(.sizeThatFits)
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
            
            PortRow(viewModel: PortRowViewModel(port))
                .previewLayout(.sizeThatFits)
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .previewDisplayName("iPhone XS Max")
        }
    }
}
