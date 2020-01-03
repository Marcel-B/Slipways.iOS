//
//  ServiceInfo.swift
//  Slipways
//
//  Created by Marcel Benders on 18.12.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI

struct ServiceInfo: View {
    let service: ServiceQl
    
    var body: some View {
//        ScrollView{
            VStack{
                
                HStack{
                    Image(systemName: "envelope")
                    Text(service.street)
                    Text("- \(service.postalcode)")
                    Text(service.city)
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
                    Text(service.url ?? "-")
                        .onTapGesture {
                            if let urlStr = self.service.url{
                                if let uri = URL(string: urlStr){
                                    UIApplication.shared.open(uri)
                                }
                            }
                    }.foregroundColor(.accentColor)
                    Spacer()
                }
                
                HStack{
                    Image(systemName: "at")
                    Text(service.email ?? "-")
                    Spacer()
                }
                
                HStack{
                    Text("Hersteller:")
                    Spacer()
                    
                }.padding(.vertical)
                VStack{
                    ForEach(service.manufacturersList){manufacturer in
                        HStack{
                            Text(manufacturer.name)
                            Spacer()
                        }
                    }.padding(.leading)
                }.padding(.bottom)
            }
        }
//    }
}

struct ServiceInfo_Previews: PreviewProvider {
    static var previews: some View {
        ServiceInfo(service: FakeData.service)
    }
}
