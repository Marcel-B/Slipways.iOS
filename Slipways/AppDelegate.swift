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
        
        let query = Data("{\"query\": \"{ slipways { id name street city postalcode costs longitude latitude water { id longname } extras { name } } waters { id longname stations { id agency number longname longitude latitude } } services { id name street city postalcode phone longitude latitude email url manufacturers { id name } } }\" }".utf8)
        
        let graphQLService = GraphQLService()
        let appData = AppData.shared
        graphQLService.fetchEntity(with: query) { (data, error) in
            if let safeData = data{
                let serializer = Serializer()
                if var importedData: ImportData = serializer.parseObject(data: safeData){
                    let updatedSlipways = importedData.data.slipways.map { (slipway) -> SlipwayQl in
                        var tmpSlipway = slipway
                        let userData = appData.getSlipwayById(id: slipway.id)
                        if let saveUserData = userData{
                            tmpSlipway.isFavorite = saveUserData.isFavorite
                        }
                        return tmpSlipway
                    }
                    importedData.data.slipways = updatedSlipways
                    let store = DataStore.shared
                    DispatchQueue.main.async{
                        store.data = importedData.data
                    }
                }
            }
            else{
                print("Error")
            }
        }
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
