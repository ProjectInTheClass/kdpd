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
    Category(name:"meat"), Category(name:"korean"),Category(name:"japanese") ,Category(name:"chinese"),Category(name:"western"),
    Category(name:"seafood"), Category(name:"fast"),Category(name:"cafe"),Category(name:"dessert") ,Category(name:"chicken"),Category(name:"beer"),Category(name:"etc")
]
    var check = 0
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       UINavigationBar.appearance().barTintColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        
        FirebaseApp.configure()
         let ref = Database.database().reference()
        
        ref.child("howManyStores").observeSingleEvent(of: .value){
            (snapshot) in
            var count = snapshot.value as? Int
            
            for i in 1 ... count! {

                ref.child("storeList/store\(i)").observeSingleEvent(of: .value)
                    
                {(snapshot) in
                    
                    var data = snapshot.value as?
                        [String:String]
                    //확인용 
//                    if (data!["category"] == nil) || data!["name"] == nil || data!["pn"] == nil || data!["wt"] == nil || data!["bt"] == nil || data!["adr"] == nil || data!["photo1"] == nil || data!["photo2"] == nil || data!["map"] == nil || data!["area"] == nil{
//                        print("nil값이 있는 항목은", data!)
//                    }
                  
                    stores.append(Store(category: "\(data!["category"]!)", name: "\(data!["name"]!)", phoneNumber: "\(data!["pn"]!)", wt: "\(data!["wt"]!)", bt: "\(data!["bt"]!)", adr: "\(data!["adr"]!)", photo1: "\(data!["photo1"]!)", photo2: "\(data!["photo2"]!)", map: "\(data!["map"]!)", Area: "\(data!["area"]!)"))
                  
                    if data!["category"]! != "디저트"{
                        if data!["category"]! != "카페"{
                            if data!["category"]! != "술집"{
                            ForRec.append(Store(category: "\(data!["category"]!)", name: "\(data!["name"]!)", phoneNumber: "\(data!["pn"]!)", wt: "\(data!["wt"]!)", bt: "\(data!["bt"]!)", adr: "\(data!["adr"]!)", photo1: "\(data!["photo1"]!)", photo2: "\(data!["photo2"]!)", map: "\(data!["map"]!)", Area: "\(data!["area"]!)"))
                            }
                        }
                    }
                    
                    
                }
            }
            
            print("가게의 수는", count!)
        }

        
        sleep(4)
        return true
    }
    
  
}

