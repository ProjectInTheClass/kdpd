//
//  AppDelegate.swift
//  kodongpd
//
//  Created by dgulinc on 17/01/2019.
//  Copyright © 2019 dgulinc. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

var stores : [Store] = []

var Categories = [
    Category(name:"고기"), Category(name:"한식"),Category(name:"일식") ,Category(name:"중식"),Category(name:"해물"),
    Category(name:"양식"), Category(name:"카페"),Category(name:"디저트") ,Category(name:"간편"),Category(name:"치킨"),Category(name:"기타")
]

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        FirebaseApp.configure()
        
        let ref = Database.database().reference()
        
        for i in 1..<127{
            
            ref.child("storeList/store\(i)").observeSingleEvent(of: .value)
                
            {(snapshot) in
                
                let data = snapshot.value as?
                    [String:String]
                
                stores.append(Store(category: "\(data!["category"]!)", name: "\(data!["name"]!)", phoneNumber: "\(data!["pn"]!)", wt: "\(data!["wt"]!)", bt: "\(data!["bt"]!)", adr: "\(data!["adr"]!)", photo1: "\(data!["photo1"]!)", photo2: "\(data!["photo2"]!)", map: "\(data!["map"]!)"))
                
            }
            
        }
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
    
/*
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FirebaseApp.configure()
        
       // let db = Firestore.firestore()
        
        
        
        let fileManager = FileManager()
        
        let desktopPath = "/Users/jeong-inho/2019iOS교육/Concentration/csvjson.json"
        
        
        
        do {
            
            //let contents = try fileManager.contentsOfDirectory(atPath: desktopPath)
            // let text = try String(contentsOf: desktopPath, encoding: .utf8)
            
            // print(text)
            
            // let contents = try NSString(contentsOfFile: desktopPath, encoding: String.Encoding.utf8.rawValue)
            
            // print(contents)
            
            if let data = try String(contentsOfFile: desktopPath).data(using: .utf8){
                
                let json = try! JSONSerialization.jsonObject(with: data, options: []) as! [[String : Any]]
                
                
                
                for testIndex in json {
                    
                    // Add a new document in collection "cities"
                    
                    db.collection("testdata").document(testIndex["album"] as! String).setData([
                        
                        "album": testIndex["album"]!,
                        
                        "year": testIndex["year"]!,
                        
                        "US_peak_chart_post": testIndex["US_peak_chart_post"]!
                        
                    ]) { err in
                        
                        if let err = err {
                            
                            print("Error writing document: \(err)")
                            
                        } else {
                            
                            print("Document successfully written!")
                            
                        }
                        
                    }
                    // db.collection("testdata").document(testIndex["album"]).setData(testIndex) { err in
                    
                    // if let err = err {
                    
                    // print("Error writing document: (err)")
                    
                    // } else {
                    
                    // print("Document successfully written!")
                    
                    // }
                    
                    // }
                    
                }
                
            }
            
            
            
        } catch let error as NSError {
            
            print("Error access directory: \(error)")
            
        }
        
        
        
        
        
        return true
    }

  

*/
}

