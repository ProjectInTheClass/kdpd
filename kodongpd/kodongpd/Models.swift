
import Foundation

class Category{
    var name:String
    var image:String
    init(name:String) {
        self.name = name
        self.image = name
    }
}
class Store{
    var name:String
    //var image:String
    init(name:String) {
        self.name = name
        //  self.image = image
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
