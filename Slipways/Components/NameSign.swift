//
//  NameSign.swift
//  Slipways
//
//  Created by Marcel Benders on 31.10.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI

struct NameSign: View {
    var name: String
    
    var body: some View {
        Text(name)
            .padding(10)
            .foregroundColor(.white)
            .background(Color .blue)
            .overlay(Rectangle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 12)
    }
}

struct NameSign_Previews: PreviewProvider {
    static var previews: some View {
        NameSign(name: slipways[0].name)
    }
}
