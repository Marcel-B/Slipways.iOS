//
//  UserData.swift
//  Slipways
//
//  Created by Marcel Benders on 05.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject{
    @Published var slipways = slipwaysData
}
