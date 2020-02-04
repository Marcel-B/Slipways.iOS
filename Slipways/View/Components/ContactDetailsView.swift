//
//  ContactDetailsView.swift
//  Slipways
//
//  Created by Marcel Benders on 28.01.20.
//  Copyright © 2020 Marcel Benders. All rights reserved.
//

import SwiftUI

struct ContactDetailsView: View {
    let content:  Contactable
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "envelope")
                Text(getAddress())
                Spacer()
            }
            
            HStack{
                Image(systemName: "phone")
                Text(content.phone ?? "-")
                    .onTapGesture {
                        if let urlStr = self.content.phone{
                            if let uri = URL(string: "tel://\(urlStr)"){
                                UIApplication.shared.open(uri)
                            }
                        }
                }.foregroundColor(.accentColor)
                Spacer()
            }
            
            HStack{
                Image(systemName: "globe")
                Text("\(content.url?.absoluteString ?? "-")")
                    .onTapGesture {
                        if let url = self.content.url{
                            UIApplication.shared.open(url)
                        }
                }.foregroundColor(.accentColor)
                Spacer()
            }
            
            HStack{
                Image(systemName: "at")
                Text(content.email ?? "-")
                    .onTapGesture {
                        if let urlStr = self.content.email{
                            if let uri = URL(string: "mailto:\(urlStr)"){
                                UIApplication.shared.open(uri)
                            }
                        }
                }.foregroundColor(.accentColor)
                Spacer()
            }
        }
    }
    
    func getAddress() -> String {
        var address = ""
        if let street = content.street{
            address += "\(street)"
        }
        if let postalcode = content.postalcode {
            address += " - \(postalcode)"
        }
        if let city = content.city {
            address += " \(city)"
        }
        return address
    }
}

struct ContactDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let service = FakeData.getService()
        return Group {
            ContactDetailsView(content: service)
                .previewLayout(.sizeThatFits)
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
                .previewDisplayName("iPhone SE")
            
            ContactDetailsView(content: service)
                .previewLayout(.sizeThatFits)
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
            
            ContactDetailsView(content: service)
                .previewLayout(.sizeThatFits)
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .previewDisplayName("iPhone XS Max")
        }
    }
}
