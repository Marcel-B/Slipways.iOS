//
//  SlipwayInfo.swift
//  Slipways
//
//  Created by Marcel Benders on 31.10.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI

//class SlipwayViewModel{
//    func getCosts(slipway: Slipway) -> String {
//        if Int(truncating: slipway.costs!) > 0{
//            return "\(slipway.costs!.stringValue) €"
//        }
//        else if slipway.costs == 0{
//            return "kostenlos"
//        }
//        return "keine Angaben"
//    }
//}

struct SlipwayInfo: View {
    let viewModel: SlipwayInfoViewModel
    
    init(viewModel: SlipwayInfoViewModel) {
//        // To remove only extra separators below the list:
//        UITableView.appearance().tableFooterView = UIView()
//        
//        // To remove all separators including the actual ones:
//        UITableView.appearance().separatorStyle = .none
        self.viewModel = viewModel
    }
    
  
    
    var body: some View {
        //        List {
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
        return SlipwayInfo(viewModel: SlipwayInfoViewModel(Slipway()))
            .previewLayout(.sizeThatFits)
    }
}
