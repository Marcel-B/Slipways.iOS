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
        //        ScrollView{
        VStack{
            
            HStack{
                Image(systemName: "envelope")
                Text(service.street ?? "n/a")
                
                Text("- ")
                    + Text(service.postalcode ?? "n/a")
                Text(service.city ?? "n/a")
                Spacer()
            }
            
            HStack{
                Image(systemName: "phone")
                Text(service.phone ?? "-")
                    .onTapGesture {
                        if let urlStr = self.service.phone{
                            if let uri = URL(string: "tel://\(urlStr)"){
                                UIApplication.shared.open(uri)
                            }
                        }
                }.foregroundColor(.accentColor)
                Spacer()
            }
            
            HStack{
                Image(systemName: "globe")
                Text("\(service.url?.absoluteString ?? "-")")
                    .onTapGesture {
                        if let url = self.service.url{
                            UIApplication.shared.open(url)
                        }
                }.foregroundColor(.accentColor)
                Spacer()
            }
            
            HStack{
                Image(systemName: "at")
                Text(service.email ?? "-")
                    .onTapGesture {
                        if let urlStr = self.service.email{
                            if let uri = URL(string: "mailto:\(urlStr)"){
                                UIApplication.shared.open(uri)
                            }
                        }
                }.foregroundColor(.accentColor)
                Spacer()
            }
            
            HStack{
                Text("Hersteller")
                
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
        ServiceInfo(service: Service())
    }
}
