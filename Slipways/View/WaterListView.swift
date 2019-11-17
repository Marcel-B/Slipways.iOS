//
//  WaterListView.swift
//  Slipways
//
//  Created by Marcel Benders on 17.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI

struct WaterListView: View {
    
    @ObservedObject var wsvService = WsvService()
    
    var body: some View {
        NavigationView{
            List(wsvService.waters){ water in
                Text(water.longname)
            }.onAppear{
                self.wsvService.loadWsv()
            }
        }.navigationBarTitle("Gewässer")
    }
}

struct WaterListView_Previews: PreviewProvider {
    static var previews: some View {
        WaterListView()
    }
}
