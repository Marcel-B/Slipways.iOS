//
//  DataProvider.swift
//  Slipways
//
//  Created by Marcel Benders on 22.01.20.
//  Copyright © 2020 Marcel Benders. All rights reserved.
//

import Foundation
import CoreData
import SwiftUI

protocol DataProvider{
    
    func getSlipways() -> [Slipway]
    func insertSlipway(_ slipwayQl: SlipwayQl)
    func insertSlipways(_ slipwaysQl: [SlipwayQl])
    
    func getPorts() -> [Port]
    func insertPort(_ portQl: PortQl)
    func insertPorts(_ portsQl: [PortQl])
    
    func getServices() -> [Service]
    func insertService(_ serviceQl: ServiceQl)
    func insertServices(_ servicesQl: [ServiceQl])
    
    func getManufacturers() -> [Manufacturer]
    func insertManufacturer(_ manufacturerQl: ManufacturerQl)
    func insertManufacturers(_ manufacturersQl: [ManufacturerQl])
    
    func getStations() -> [Station]
    func insertStation(_ stationQl: StationQl)
    func insertStations(_ stationsQl: [StationQl])
    
    func getWaters() -> [Water]
    func insertWater(_ waterQl: WaterQl)
    func insertWaters(_ watersQl: [WaterQl])
    
    func getExtras() -> [Extra]
    func insertExtra(_ extraQl: ExtraQl)
    func insertExtras(_ extrasQl: [ExtraQl])
    
    func save()
}

class DbDataProvider: DataProvider{
    var managedObjectContext: NSManagedObjectContext
    
    init(managedObjectContext: NSManagedObjectContext) {
        self.managedObjectContext = managedObjectContext
    }
    
    func save(){
        if self.managedObjectContext.hasChanges{
            do{
                try self.managedObjectContext.save()}
            catch{
                let nserror = error as NSError
                print("Error while saving database")
                print("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func getFetch(entityName: String) -> NSFetchRequest<NSFetchRequestResult>{
        NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
    }
    
    func getFetchResult<T>(entityName: String) -> [T]{
        do{
            let fetch = self.getFetch(entityName: entityName)
            let fetchResult = try self.managedObjectContext.fetch(fetch)
            let  result = fetchResult as! [T]
            return result
        }catch{
            print(error)
        }
        return [T]()
    }
    
    // MARK: - Section Water
    func getWaters() -> [Water]{
        let water: [Water] = getFetchResult(entityName: Entity.Water)
        return water
    }
    
    func insertWater(_ waterQl: WaterQl) {
        managedObjectContext.performAndWait {
            let water = Water(context: self.managedObjectContext)
            water.id = UUID(uuidString: waterQl.id)
            water.name = waterQl.name
            water.lastUpdate = waterQl.updated
            self.save()
        }
    }
    
    func insertWaters(_ watersQl: [WaterQl]) {
        managedObjectContext.performAndWait {
            for waterQl in watersQl{
                let water = Water(context: self.managedObjectContext)
                water.id = UUID(uuidString: waterQl.id)
                water.name = waterQl.name
                water.lastUpdate = waterQl.updated
            }
            self.save()
        }
    }
    
    // MARK: - Section Extra
    func getExtras() -> [Extra]{
        let extras: [Extra] = getFetchResult(entityName: Entity.Extra)
        return extras
    }
    
    func insertExtra(_ extraQl: ExtraQl)  {
        managedObjectContext.performAndWait {
            let extra = Extra(context: self.managedObjectContext)
            extra.id =  UUID(uuidString: extraQl.id)
            extra.name = extraQl.name
            extra.lastUpdate = extraQl.updated
            self.save()
        }
    }
    
    func insertExtras(_ extrasQl: [ExtraQl]){
        managedObjectContext.performAndWait {
            for extraQl in extrasQl{
                let extra = Extra(context: self.managedObjectContext)
                extra.id =  UUID(uuidString: extraQl.id)
                extra.name = extraQl.name
                extra.lastUpdate = extraQl.updated
            }
            self.save()
        }
    }
    
    // MARK: - Section Manufacturers
    func getManufacturers() -> [Manufacturer]{
        let manufacturers: [Manufacturer] = getFetchResult(entityName: Entity.Manufacturer)
        return manufacturers
    }
    
    func insertManufacturer(_ manufacturerQl: ManufacturerQl) {
        let manufacturer = Manufacturer(context: self.managedObjectContext)
        manufacturer.id = manufacturerQl.uuid
        manufacturer.name = manufacturerQl.name
        manufacturer.lastUpdate = manufacturerQl.updated
        self.save()
    }
    
    func insertManufacturers(_ manufacturersQl: [ManufacturerQl]){
        managedObjectContext.performAndWait {
            for manufacturerQl in manufacturersQl{
                let manufacturer = Manufacturer(context: self.managedObjectContext)
                manufacturer.id = manufacturerQl.uuid
                manufacturer.name = manufacturerQl.name
                manufacturer.lastUpdate = manufacturerQl.updated
            }
            self.save()
        }
    }
    
    // MARK: - Section Stations
    func getStations() -> [Station]{
        let stations: [Station] = getFetchResult(entityName: Entity.Station)
        return stations
    }
    
    func insertStations(_ stationsQl: [StationQl]){
        managedObjectContext.performAndWait {
            let waters = self.getWaters()
            for stationQl in stationsQl{
                let station = Station(context: self.managedObjectContext)
                station.water = waters.first { $0.id == stationQl.water!.uuid }
                station.name = stationQl.name
                station.agency = stationQl.agency
                station.number = stationQl.number
                station.lastUpdate = stationQl.updated
                station.longitude = stationQl.longitude
                station.latitude = stationQl.latitude
                station.id =  stationQl.uuid
            }
            self.save()
        }
    }
    
    func insertStation(_ stationQl: StationQl) {
    }
    
    // MARK: - Section Services
    func getServices() -> [Service]{
        let services: [Service] = getFetchResult(entityName: Entity.Service)
        return services
    }
    
    func insertServices(_ servicesQl: [ServiceQl]) {
        managedObjectContext.performAndWait {
            let manufacturers = self.getManufacturers()
            
            for serviceQl in servicesQl{
                let service = Service(context: self.managedObjectContext)
                
                service.id = serviceQl.uuid
                service.name = serviceQl.name
                service.city = serviceQl.city
                service.longitude = serviceQl.longitude
                service.latitude = serviceQl.latitude
                service.postalcode = serviceQl.postalcode
                service.street = serviceQl.street
                service.email = serviceQl.email
                service.lastUpdate = serviceQl.updated
                service.phone = serviceQl.phone
                
                if let url = serviceQl.url{
                    service.url = URL(string: url)
                }
                
                if let manufacturersQl = serviceQl.manufacturers{
                    for manufacturerQl in manufacturersQl {
                        if let manufacturer = manufacturers.first(where: { $0.id == manufacturerQl.uuid }){
                            service.addToManufacturers(manufacturer)
                        }
                    }
                }
            }
            self.save()
        }
    }
    func insertService(_ serviceQl: ServiceQl){
    }
    
    // MARK: - Section Slipways
    func getSlipways() -> [Slipway]{
        let slipways: [Slipway] = getFetchResult(entityName: Entity.Slipway)
        return slipways
    }
    
    func insertSlipways(_ slipwaysQl:[SlipwayQl]){
        managedObjectContext.performAndWait {
            let waters = self.getWaters()
            let extras = self.getExtras()
            let ports = self.getPorts()
            let slipways = self.getSlipways()
            
            for slipwayQl in slipwaysQl{
                let hasSlipway = slipways.contains { $0.id == slipwayQl.uuid}
                if hasSlipway{
                    let slipway = slipways.first { $0.id == slipwayQl.uuid }
                    slipway?.fromSlipwayQl(slipwayQl)
                }else{
                    let slipway = Slipway(context: self.managedObjectContext)
                    
                    slipway.id = slipwayQl.uuid
                    slipway.name = slipwayQl.name
                    slipway.city = slipwayQl.city
                    slipway.longitude = slipwayQl.longitude
                    slipway.latitude = slipwayQl.latitude
                    slipway.postalcode = slipwayQl.postalcode
                    slipway.lastUpdate = slipwayQl.updated
                    slipway.street = slipwayQl.street
                    slipway.costs = NSDecimalNumber(decimal: slipwayQl.costs)
                    
                    let water = waters.first{$0.id == slipwayQl.water.uuid}
                    slipway.water = water
                    
                    if let portQl = slipwayQl.port{
                        if let port = ports.first(where: { $0.id == portQl.uuid }) {
                            slipway.port = port
                        }
                    }
                    
                    for extraQl in slipwayQl.extras {
                        if let extra = extras.first(where: { $0.id == extraQl.uuid }){
                            slipway.addToExtra(extra)
                        }
                    }
                }
            }
            self.save()
        }
    }
    
    func insertSlipway(_ slipwayQl: SlipwayQl)  {
    }
    
    // MARK: - Section Ports
    func getPorts() -> [Port]{
        let ports: [Port] = getFetchResult(entityName: Entity.Port)
        return ports
    }
    
    func insertPort(_ portQl: PortQl) {
        
    }
    
    func insertPorts(_ portsQl: [PortQl]){
        managedObjectContext.performAndWait {
            let waters = self.getWaters()
            let slipways = self.getSlipways()
            
            for portQl in portsQl{
                let portSlipways = slipways.filter { (slipway) -> Bool in
                    if let port = slipway.port{
                        if port.id == portQl.uuid{
                            return true
                        }
                    }
                    return false
                }
                
                let port = Port(context: self.managedObjectContext)
                
                port.id = portQl.uuid
                port.name = portQl.name
                port.city = portQl.city
                port.longitude = portQl.longitude
                port.latitude = portQl.latitude
                port.postalcode = portQl.postalcode
                port.street = portQl.street
                port.email = portQl.email
                port.lastUpdate = portQl.updated
                port.phone = portQl.phone
                
                if let url = portQl.url{
                    port.url = URL(string: url)
                }
                if let waterQl = portQl.water{
                    let water = waters.first{$0.id == waterQl.uuid}
                    port.water = water
                }
                for slipway in portSlipways{
                    port.addToSlipway(slipway)
                }
            }
            self.save()
        }
    }
}
