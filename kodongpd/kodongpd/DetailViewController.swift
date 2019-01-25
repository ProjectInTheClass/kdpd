
import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var storeLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var wtLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var btLabel: UILabel!
    @IBOutlet weak var naeverButton: UIButton!
    var item: Store?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // 이미지 뷰 하단 구분선 그리기
        let borderLayer = CALayer()
        borderLayer.backgroundColor = UIColor.lightGray.cgColor
        borderLayer.frame = CGRect(x: 0, y: self.imageView.frame.height - 0.5, width: self.imageView.frame.width, height: 0.5)
        self.imageView.layer.addSublayer(borderLayer)
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // 옵셔널
        if let item = item {
            storeLabel.text = item.name
           /* userNameLabel.text = item.user.name
            if let imageName = item.user.image {
                userImageView.image = UIImage(named: imageName)
            }
            priceLabel.text = String(item.price)
            
            if let size = item.size {
                depthLabel.text = "\(size.d)cm"
                widthLabel.text = "\(size.w)cm"
                heightLabel.text = "\(size.h)cm"
            }
            
            images = item.detailImage ?? []
            showImage(index: 0)
            */
            //self.title = item.name
            
            // 좋아요가 눌러졌는지 좋아요 버튼에 반영
            //likeButton.isSelected = Liked.shared.isLiked(item)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}
