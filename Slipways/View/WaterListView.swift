//
//  WaterListView.swift
//  Slipways
//
//  Created by Marcel Benders on 17.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI

struct WaterListView: View {
    @ObservedObject var slipwayService = SlipwayService<Water>()
    
    var body: some View {
        List(slipwayService.data){ water in
            Text(water.longname)
        }.navigationBarTitle("Gewässer").onAppear{
            self.slipwayService.fetchData(link: Links().waters)
        }
    }
}

struct WaterListView_Previews: PreviewProvider {
    static var previews: some View {
        WaterListView()
    }
}
