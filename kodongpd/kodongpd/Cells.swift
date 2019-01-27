
import UIKit
class CategoryCell: UICollectionViewCell{
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodLabel: UILabel!
    
    override func awakeFromNib() { //초기화
        super.awakeFromNib()
    }
    
}

class StoreCell: UICollectionViewCell{
    @IBOutlet weak var storeImage: UIImageView!
    @IBOutlet weak var storeLabel: UILabel!
    
    override func awakeFromNib() { //초기화
        super.awakeFromNib()
    }
    
}
//
//class LikeCell: UITableViewCell{
//    @IBOutlet weak var likeLabel: UILabel!
//    @IBOutlet weak var likeImage: UIImageView!
//
//    override func awakeFromNib() { //초기화
//        super.awakeFromNib()
//    }
//
//}

