//
//  SlipwayInfo.swift
//  Slipways
//
//  Created by Marcel Benders on 31.10.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI

class SlipwayViewModel{
    func getCosts(slipway: Slipway) -> String {
        if Int(truncating: slipway.costs!) > 0{
            return "\(slipway.costs!.stringValue) €"
        }
        else if slipway.costs == 0{
            return "kostenlos"
        }
        return "keine Angaben"
    }
}

struct SlipwayInfo: View {
    var slipway: Slipway
    let slipwayViewModel = SlipwayViewModel()
    
    init(slipway: Slipway) {
        // To remove only extra separators below the list:
        UITableView.appearance().tableFooterView = UIView()
        
        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
        self.slipway = slipway
    }
    
    var body: some View {
        //        List {
        VStack{
            
            HStack {
                Text("Straße: \(slipway.street ?? "n/a")")
                Spacer()
            }.padding(.top)
            HStack {
                
                Text("Stadt / Ort: \(slipway.city ?? "n/a")")
                Spacer()
            }.padding(.top)
            HStack {
                Text("PLZ: \(slipway.postalcode ?? "n/a")")
                Spacer()
            }.padding(.top)
            HStack {
                Text("Kosten: \(slipwayViewModel.getCosts(slipway: slipway))")
                Spacer()
            }.padding(.top)
            
            HStack{
                
                Text("Gewässer: \(slipway.water!.name ?? "n/a")")
                Image(systemName: "w.square")
                    .foregroundColor(.accentColor)
                    .onTapGesture {
                        let urlStr = "https://de.wikipedia.org/wiki/\(self.slipway.water!.name ?? "n/a")"
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
        return SlipwayInfo(slipway: Slipway())
            .previewLayout(.sizeThatFits)
    }
}
