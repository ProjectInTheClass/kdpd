import UIKit
import Firebase
import FirebaseDatabase

// 데이터베이스에서 불러온 가게들 저장
var stores : [Store] = []
//추천을 위한 가게들
var ForRec : [Store] = []
//추천가게 상세정보를 위한 인덱스
var id = 0

//카테고리들 저장
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
        
        ref.child("howManyStores").observeSingleEvent(of: .value){
            (snapshot) in
            var count = snapshot.value as? Int
            
            for i in 1 ... count! {
                
                ref.child("storeList/store\(i)").observeSingleEvent(of: .value)
                    
                {(snapshot) in
                    
                    let data = snapshot.value as?
                        [String:String]
                    
                    stores.append(Store(category: "\(data!["category"]!)", name: "\(data!["name"]!)", phoneNumber: "\(data!["pn"]!)", wt: "\(data!["wt"]!)", bt: "\(data!["bt"]!)", adr: "\(data!["adr"]!)", photo1: "\(data!["photo1"]!)", photo2: "\(data!["photo2"]!)", map: "\(data!["map"]!)"))
                    
                    if data!["category"]! != "디저트"{
                        if data!["category"]! != "카페"{
                            ForRec.append(Store(category: "\(data!["category"]!)", name: "\(data!["name"]!)", phoneNumber: "\(data!["pn"]!)", wt: "\(data!["wt"]!)", bt: "\(data!["bt"]!)", adr: "\(data!["adr"]!)", photo1: "\(data!["photo1"]!)", photo2: "\(data!["photo2"]!)", map: "\(data!["map"]!)"))
                            print (data!["category"]!)
                        }
                    }
                    
                    
                }
            }
            
            print("가게의 수는", count!)
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

}

