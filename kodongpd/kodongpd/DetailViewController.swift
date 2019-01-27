
import UIKit
import PINRemoteImage

class DetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var storeLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var wtLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var btLabel: UILabel!
    @IBOutlet weak var naverButton: UIButton!
    
    //사진 넘기기 버튼
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    
    var store: Store?
    
    var Name = ""
    var location = ""
    var phoneNum = ""
    var BT = ""
    var WT = ""
    var Map = ""
    var p1 = ""
    var p2 = ""

    //사진
    var images: [String] = []
    var currentImageIndex = 0
    
    
    @IBAction func showNextImage(_ sender: Any) {
        currentImageIndex += 1
        self.showImage(index: currentImageIndex)
    }
    
    @IBAction func showPreImage(_ sender: Any) {
        currentImageIndex -= 1
        self.showImage(index: currentImageIndex)
    }
    
    func showImage(index: Int) {
        let imageUrl = images[index]
        imageView.pin_setImage(from: URL(string: "\(imageUrl)"))
        
        // 좌/우 이미지 이동이 불가능한 상태면 버튼 상태를 disabled로
        leftButton.isEnabled = index > 0
        rightButton.isEnabled = index < images.count - 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //제대로 됐나 확인하기
        print("내가 선택한 가게 이름은", Name)
        
        images.append(p1)
        images.append(p2)
        
        // 초기 이미지는 첫번째 이미지이므로 왼쪽 버튼은 disabled로
        leftButton.isEnabled = false
        
        // 이미지 뷰 하단 구분선 그리기
        let borderLayer = CALayer()
        borderLayer.backgroundColor = UIColor.lightGray.cgColor
        borderLayer.frame = CGRect(x: 0, y: self.imageView.frame.height - 0.5, width: self.imageView.frame.width, height: 0.5)
        self.imageView.layer.addSublayer(borderLayer)
    
        //가게정보 가져오기
        storeLabel?.text? = Name
        locationLabel.text = location
        wtLabel.text = WT
        numberLabel.text = phoneNum
        btLabel.text = BT
        imageView.pin_setImage(from: URL(string: p1))
    }
    
    //좋아요 저장
    @IBAction func handleLike(_ sender: Any){
        if let store = self.store{
            if Liked.shared.isLiked(store){
                Liked.shared.remove(store)
                likeButton.isSelected = false
            }
            else{
                Liked.shared.add(store)
                likeButton.isSelected = true
            }
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        // 옵셔널
        if let store = store {
            storeLabel.text = store.name
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
            likeButton.isSelected = Liked.shared.isLiked(store)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func didTapDetail(_ sender: Any) {
        
        if let url = NSURL(string: Map) {
            if Map == "x"{
                let MapErrorAlert = UIAlertController(title: "알림", message: "네이버 지도 정보가 없습니다.", preferredStyle: .alert)
                let dism = UIAlertAction(title: "Ok", style: .default, handler: nil)
                MapErrorAlert.addAction(dism)
                self.present(MapErrorAlert, animated: true, completion: nil)
                
            }else{
                UIApplication.shared.open(url as URL)
            }
        }
    }
    

}
