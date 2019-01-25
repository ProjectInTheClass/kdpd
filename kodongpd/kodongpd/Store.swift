
import Foundation
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
