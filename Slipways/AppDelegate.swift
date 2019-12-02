//
//  AppDelegate.swift
//  Slipways
//
//  Created by Marcel Benders on 31.10.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let dataStore = DataStore.shared
        let tokenService = TokenService()
        tokenService.getToken { (token) in
            dataStore.token = token
            
            let waterService = WaterService()
            waterService.getWaters { (waters, error) in
                if error != nil{
                    debugPrint(error ?? "na")
                }
                else{
                    if let safeWaters = waters{
                        DispatchQueue.main.async{
                            dataStore.waters = safeWaters
                        }
                    }
                }
            }
            
            let stationService = StationService()
            stationService.getStations { (stations, error) in
                if error != nil{
                    debugPrint(error ?? "na")
                }else{
                    if let safeStations = stations{
                        DispatchQueue.main.async {
                            dataStore.stations = safeStations
                        }
                    }
                }
            }
            
            let slipwayService = SlipwayService()
            slipwayService.getSlipways { (slipways, error) in
                if error != nil{
                    debugPrint(error ?? "na")
                }else{
                    if let safeSlipways = slipways{
                        DispatchQueue.main.async {
                            dataStore.slipways = safeSlipways
                        }
                    }
                }
            }
            
        }
        
        // debugPrint(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last)
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}
