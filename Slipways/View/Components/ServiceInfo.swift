//
//  ServiceInfo.swift
//  Slipways
//
//  Created by Marcel Benders on 18.12.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI


extension AnyTransition {
    static var moveAndFade: AnyTransition {
        let insertion = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
        let removal = AnyTransition.scale
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

struct ServiceInfo: View {
    let service: Service
    @State private var showDetail = false
    
    var body: some View {
        VStack{
            ContactDetailsView(content: service)
            HStack{
                Text("Manufacturer")
                
                Button(action: {
                    withAnimation {
                        self.showDetail.toggle()
                    }
                }) {
                    Image(systemName: "chevron.right.circle")
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                        // .scaleEffect(showDetail ? 1.5 : 1)
                        .animation(.spring(dampingFraction: 0.5))
                        .padding()
                }
                Spacer()
            }
            
            if showDetail {
                VStack{
                    ForEach(service.manufacturers?.array as! [Manufacturer], id: \.self) { manufacturer in
                        HStack{
                            Text(manufacturer.name ?? "n/a")
                            Spacer()
                        }
                    }.padding(.leading)
                }.transition(.moveAndFade).padding(.bottom)
            }
        }
    }
}

struct ServiceInfo_Previews: PreviewProvider {
    static var previews: some View {
        let service = FakeData.getService()
        return Group {
            ServiceInfo(service: service)
                .previewLayout(.sizeThatFits)
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
                .previewDisplayName("iPhone SE")
            
            ServiceInfo(service: service)
                .previewLayout(.sizeThatFits)
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
            
            ServiceInfo(service: service)
                .previewLayout(.sizeThatFits)
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .previewDisplayName("iPhone XS Max")
        }
    }
}
