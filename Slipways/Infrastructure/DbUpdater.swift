//
//  DbUpdater.swift
//  Slipways
//
//  Created by Marcel Benders on 13.01.20.
//  Copyright © 2020 Marcel Benders. All rights reserved.
//

import Foundation
import CoreData
import SwiftUI

protocol Updater {
    func initializeApplicationData()
}

class DbUpdater : Updater{
    
    var serializer: ObjectParser
    var dataProvider: DataProvider
    
    init(serializer: ObjectParser, dataProvider: DataProvider) {
        self.serializer = serializer
        self.dataProvider = dataProvider
    }
    
    let graphQLService = GraphQLService()
    
    // MARK: - Selection Initialization
    func initializeApplicationData(){
        DispatchQueue.global(qos: .background).async {
            self.initializeAppData { (report, error) in
                
            }
        }
    }

    func fetchAppData(completion: @escaping (_ result: AppDataQl, _ error: String?) -> Void){
        graphQLService.fetchEntity(with: Data(Query.AppData.utf8)) { (data, error) in
            if error != nil{
                completion(AppDataQl(), "Error while fetching AppData from GraphQL API")
            } else{
                if let safeData = data{
                    if let appData: FetchResult = self.serializer.parseObject(data: safeData){
                        completion(appData.data.appData, nil)
                    }else{
                        completion(AppDataQl(), "Error while deserializing AppData")
                    }
                }else{
                    completion(AppDataQl(), "Error while unwrapping AppData")
                }
            }
        }
    }
    
    func initializeAppData(completion: @escaping (_ report: String?, _ error: String?) -> Void){
        fetchAppData { (appDataQl, error) in
            if error != nil{
                print(error!)
            }else{
                let a = self.initializeExtras(extrasQl: appDataQl.extras)
                print(a)
                
                let c = self.initializeManufacturers(manufacturersQl: appDataQl.manufacturers)
                print(c)
                
                let r = self.initializeWaters(watersQl: appDataQl.waters)
                print(r)
                
                let e = self.initializeStations(stationsQl: appDataQl.stations)
                print(e)
                
                let b = self.initializeServices(servicesQl: appDataQl.services)
                print(b)
                
                let f = self.initializePorts(portsQl: appDataQl.ports)
                print(f)
                
                let d = self.initializeSlipways(slipwaysQl: appDataQl.slipways)
                print(d)
            }
        }
    }
    
    // MARK: - Selection Ports
    func initializePorts(portsQl: [PortQl]) -> String {
        debugPrint("==> Init Context for Ports <==")
           
        let ports = dataProvider.getPorts()
        var newPorts = [PortQl]()
        
        var old = 0
        var new = 0
        let updated = 0
        
        for portQl in portsQl {
            let hasPort = ports.contains { $0.id == portQl.uuid }
            if !hasPort {
                newPorts.append(portQl)
                new += 1
            }else {
                old += 1
            }
        }
        dataProvider.insertPorts(newPorts)
        return "Ports:\nOld: \(old) - New: \(new) - Updated: \(updated)"
    }
    
    // MARK: - Selection Slipways
    func initializeSlipways(slipwaysQl: [SlipwayQl]) -> String {
        debugPrint("==> Init Context for Slipways <==")
        
        let slipways = dataProvider.getSlipways()
        var old = 0
        var new = 0
        var updated = 0
        var newSlipways = [SlipwayQl]()
        
        for slipwayQl in slipwaysQl{
            let id = slipwayQl.uuid
            let hasSlipway = slipways.contains{$0.id == id}
            if !hasSlipway{
                new += 1
                newSlipways.append(slipwayQl)
            }else{
                // TODO - Check for updates
                if let lastUpdateQl = slipwayQl.updated {
                    // Der Datensatz erfuhr mal ein Update
                    let slipway = slipways.first(where: { $0.id == slipwayQl.uuid})!
                    if let lastUpdate = slipway.lastUpdate{
                        // Der Datenbankwert erfuhr auch mal ein update
                        // Schauen ob es was neues gibt
                        if lastUpdateQl > lastUpdate {
                            newSlipways.append(slipwayQl)
                            updated += 1
                        }
                    }else{
                        // Datensatz ändern
                        newSlipways.append(slipwayQl)
                        print("Alter Data")
                        updated += 1
                    }
                }else {
                    // Sonderlocke - Wert kam erst ab version 1.2.1.0 hinzu
                    let slipway = slipways.first(where: { $0.id == slipwayQl.uuid})!
                    if slipway.country == nil {
                        slipway.country = slipwayQl.country
                        newSlipways.append(slipwayQl)
                        print("Alter Data")
                        updated += 1
                    // Kann entfernt werden wenn alle kleinen Versionen nicht mehr da sind
                    }else{
                        old += 1
                    }
                }
            }
        }
        dataProvider.insertSlipways(newSlipways)
        return "Slipways:\nOld: \(old) - New: \(new) - Updated: \(updated)"
    }

    // MARK: - Section Stations
    func initializeStations(stationsQl: [StationQl]) -> String {
        debugPrint("==> Init Context for Stations <==")
        let stations = dataProvider.getStations()
        var newStations = [StationQl]()
        
        var new = 0
        var updated = 0
        var old = 0
        
        for stationQl in stationsQl {
            let containsStation = stations.contains { (station) -> Bool in
                station.id == stationQl.uuid
            }
            if !containsStation{
                new += 1
                newStations.append(stationQl)
            }else{
                if let lastUpdateQl = stationQl.updated {
                    let station  = stations.first(where: { $0.id == stationQl.uuid})!
                    if let lastUpdate = station.lastUpdate{
                        if lastUpdateQl > lastUpdate {
                            newStations.append(stationQl)
                            updated += 1
                        }
                    }else{
                        print("Alter Data")
                        newStations.append(stationQl)
                        updated += 1
                    }
                }else{
                    old += 1
                }
            }
        }
        dataProvider.insertStations(newStations)
        return "Stations:\nOld: \(old) - New: \(new) - Updated: \(updated)"
    }
    
    // MARK: - Section Waters
    func initializeWaters(watersQl: [WaterQl]) -> String {
        debugPrint("==> Init Context for Waters <==")
        
        let waters = dataProvider.getWaters()
        var newWaters = [WaterQl]()
        var old = 0
        var new = 0
        var updated = 0
        
        for waterQl in watersQl{
            let id = waterQl.uuid
            let hasWater = waters.contains { (water) -> Bool in
                water.id == id
            }
            if !hasWater {
                new += 1
                newWaters.append(waterQl)
            }else{
                if let lastUpdateQl = waterQl.updated {
                    let water  = waters.first(where: { $0.id == waterQl.uuid})!
                    if let lastUpdate = water.lastUpdate{
                        if lastUpdateQl > lastUpdate {
                            newWaters.append(waterQl)
                            updated += 1
                        }
                    }else{
                        print("Alter Data")
                        newWaters.append(waterQl)
                        updated += 1
                    }
                }else{
                    old += 1
                }
            }
        }
        dataProvider.insertWaters(newWaters)
        return "Waters:\nOld: \(old) - New: \(new) - Updated: \(updated)"
    }

    // MARK: - Section Manufacturers
    func initializeManufacturers(manufacturersQl: [ManufacturerQl]) -> String {
        debugPrint("==> Init Context for Manufacturers <==")
        
        let manufacturers = self.dataProvider.getManufacturers()
        
        var old = 0
        var new = 0
        var updated = 0
        
        var newManufacturers = [ManufacturerQl]()
        for manufacturerQl in manufacturersQl{
            let hasData = manufacturers.contains { $0.id == manufacturerQl.uuid }
            if !hasData{
                newManufacturers.append(manufacturerQl)
                new += 1
            }else{
                old += 1
            }
        }
        
        dataProvider.insertManufacturers(newManufacturers)
        return "Manufacturers:\nOld: \(old) - New: \(new) - Updated: \(updated)"
    }
    
    // MARK: - Section Extras
    func initializeExtras(extrasQl: [ExtraQl]) -> String {
        debugPrint("==> Init Context for Extras <==")

        let extras = self.dataProvider.getExtras()
        
        var old = 0
        var new = 0
        var updated = 0
        
        var newExtras = [ExtraQl]()
        
        for extraQl in extrasQl{
            let hasExtra = extras.contains { $0.id == extraQl.uuid }
            if !hasExtra {
                newExtras.append(extraQl)
                new += 1
            }
            // PROVIDE Updates
            else{
                old += 1
            }
        }
        dataProvider.insertExtras(newExtras)
        return "Extras:\nOld: \(old) - New: \(new) - Updated: \(updated)"
    }
    
    // MARK: - Section Services
    func initializeServices(servicesQl: [ServiceQl])-> String {
        debugPrint("==> Init Context for Services <==")
        let services = dataProvider.getServices()
        var newServices = [ServiceQl]()
        
        var old = 0
        var new = 0
        var updated = 0
        
        for serviceQl in servicesQl{
            let id = UUID(uuidString: serviceQl.id)
            let hasService = services.contains { (service) -> Bool in
                service.id == id
            }
            if !hasService {
                new += 1
                newServices.append(serviceQl)
            }else{
                if let lastUpdateQl = serviceQl.updated {
                    // Der Datensatz erfuhr mal ein Update
                    let service = services.first(where: { $0.id == serviceQl.uuid})!
                    if let lastUpdate = service.lastUpdate{
                        // Der Datenbankwert erfuhr auch mal ein update
                        // Schauen ob es was neues gibt
                        if lastUpdateQl > lastUpdate {
                            updated += 1
                            newServices.append(serviceQl)
                        }
                    }else{
                        // Datensatz ändern
                        newServices.append(serviceQl)
                        updated += 1
                    }
                }else{
                    old += 1
                }
            }
        }
        dataProvider.insertServices(newServices)
        return "Service:\nOld: \(old) - New: \(new) - Updated: \(updated)"
    }
}
