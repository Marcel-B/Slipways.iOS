//
//  FakeData.swift
//  Slipways
//
//  Created by Marcel Benders on 25.11.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData

struct FakeData{
    
    

    static func getPort() -> Port {
        guard let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else {
            fatalError("Unable to read managed object context.")
        }
        
        let dataProvider = DbDataProvider(managedObjectContext: context)
        let ports = dataProvider.getPorts()
        
        let port =  ports.first { (port) -> Bool in
            true
        }
        return port!
    }
    
    static func getSlipway() -> Slipway {
         guard let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else {
             fatalError("Unable to read managed object context.")
         }
         
         let dataProvider = DbDataProvider(managedObjectContext: context)
         let slipways = dataProvider.getSlipways()
         
         let slipway =  slipways.first { (slipway) -> Bool in
             true
         }
         return slipway!
     }
    
    static func getService() -> Service {
          guard let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else {
              fatalError("Unable to read managed object context.")
          }
          
          let dataProvider = DbDataProvider(managedObjectContext: context)
          let services = dataProvider.getServices()
          
          let service =  services.first { (service) -> Bool in
              true
          }
          return service!
      }
    
    static func getStation() -> Station {
        guard let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else {
            fatalError("Unable to read managed object context.")
        }
        
        let dataProvider = DbDataProvider(managedObjectContext: context)
        let stations = dataProvider.getStations()
        
        let station =  stations.first { (service) -> Bool in
            true
        }
        return station!
    }
    
    static func getWater() -> Water {
        guard let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else {
            fatalError("Unable to read managed object context.")
        }
        
        let dataProvider = DbDataProvider(managedObjectContext: context)
        let waters = dataProvider.getWaters()
        
        let water =  waters.first { (water) -> Bool in
            true
        }
        return water!
    }
    
    static let service = ServiceQl(id: "123-123", name: "Meyer Motoren", longitude: 2.2, latitude: 1.1, phone: "0020-3342 242", url: "https://foo.de", street: "Musterstr. 111", postalcode: "47800", city: "Krefeld", email: "Mopa@foo.de", manufacturers: manufacturers)
    
    static let manufacturers = [ManufacturerQl(id: "123", name: "Yamaha"), ManufacturerQl(id: "234", name: "Mercury")]
}
