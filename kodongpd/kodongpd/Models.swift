
import Foundation

class Category{
    var name:String
    var image:String
    init(name:String) {
        image = name
        switch name {
        case "meat":
            self.name = "고기"
        case "korean":
            self.name = "한식"
        case "japanese":
            self.name = "일식"
        case "chinese":
            self.name = "중식"
        case "seafood":
            self.name = "해물"
        case "western":
            self.name = "양식"
        case "cafe":
            self.name = "카페"
        case "dessert":
            self.name = "디저트"
        case "fast":
            self.name = "간편"
        case "chicken":
            self.name = "치킨"
        case "etc":
            self.name = "기타"
        case "beer":
            self.name = "술집"
        default:
            self.name = ""
        }
        
        //self.name = name
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
    var Area:String
    
    init(category:String, name:String, phoneNumber:String, wt:String, bt:String, adr:String, photo1:String, photo2:String, map:String, Area:String) {
        self.category = category
        self.name = name
        self.phoneNumber = phoneNumber
        self.wt = wt
        self.bt = bt
        self.adr = adr
        self.photo1 = photo1
        self.photo2 = photo2
        self.map = map
        self.Area = Area
    }
}

struct Liked {
    static var shared = Liked()
    
    //좋아요 한 가게들을 담는 배열
    var saves : [Store] = []
    //좋아요를 누른 가게의 이름과 같은지 확인
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
