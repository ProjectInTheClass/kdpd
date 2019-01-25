
import Foundation

class Category{
    var name:String
    
    init(name:String) {
        self.name = name
    }
}
class Store{
    var category:String
    var name:String
    var phoneNumber:String
    var wt:String
    var bt:String
    var adr:String
    var photo1:String
    var photo2:String
    var map:String
    
    init(category:String, name:String, phoneNumber:String, wt:String, bt:String, adr:String, photo1:String, photo2:String, map:String) {
        self.category = category
        self.name = name
        self.phoneNumber = phoneNumber
        self.wt = wt
        self.bt = bt
        self.adr = adr
        self.photo1 = photo1
        self.photo2 = photo2
        self.map = map
    }
}

struct Liked {
    // Singleton
    static var shared = Liked()
    
    var saves : [Store] = []
    
    func isLiked(_ item: Store) -> Bool {
        for one in saves {
            // 제품 이름으로 같다고 비교한다. TODO : equal operator 작성
            if one.name == item.name {
                return true
            }
        }
        return false
    }
    
    mutating func add(_ item: Store) {
        self.saves.append(item)
    }
    
    mutating func remove(_ item: Store) {
        for (index, one) in saves.enumerated() {
            // 제품 이름으로 같다고 비교한다. TODO : equal operator 작성
            if one.name == item.name {
                saves.remove(at: index)
                return
            }
        }
    }
}
