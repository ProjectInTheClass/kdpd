import UIKit

class CategoryCell: UICollectionViewCell{
    
    //카테고리 이미지, 이름
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodLabel: UILabel!
    
    override func awakeFromNib() { //초기화
        super.awakeFromNib()
    }
    
}

class StoreCell: UICollectionViewCell{
    //가게들 이미지, 이름
    @IBOutlet weak var storeImage: UIImageView!
    @IBOutlet weak var storeLabel: UILabel!
    
    override func awakeFromNib() { //초기화
        super.awakeFromNib()
    }
    
}
//
class LikeCell: UITableViewCell{
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var backgroundLabel: UILabel!
    @IBOutlet weak var likeImage: UIImageView!

    override func awakeFromNib() { //초기화
        super.awakeFromNib()
    }

}

