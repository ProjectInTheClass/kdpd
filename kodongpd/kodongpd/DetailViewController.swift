
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
    
    
    var store: Store?
    
    
    //사진
    var images: [String] = []
    var i = Int()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = store?.name
        
        images.append((store?.photo1)!)
        images.append((store?.photo2)!)
        
        let swipeLeftGesture=UISwipeGestureRecognizer(target: self, action: #selector(SwipeLeftImage))
        imageView.isUserInteractionEnabled=true
        swipeLeftGesture.direction = UISwipeGestureRecognizer.Direction.left
        imageView.addGestureRecognizer(swipeLeftGesture)
        
        let swipeRightGesture=UISwipeGestureRecognizer(target: self, action: #selector(SwipeRightImage))
        swipeRightGesture.direction = UISwipeGestureRecognizer.Direction.right
        imageView.addGestureRecognizer(swipeRightGesture)
        
        
        // 이미지 뷰 하단 구분선 그리기
        let borderLayer = CALayer()
        borderLayer.backgroundColor = UIColor.lightGray.cgColor
        borderLayer.frame = CGRect(x: 0, y: self.imageView.frame.height - 0.5, width: self.imageView.frame.width, height: 0.5)
        self.imageView.layer.addSublayer(borderLayer)
        imageView.layer.borderWidth = 0.5
        
        //가게정보 가져오기
        storeLabel?.text = store?.name
        if store?.adr == "x" {
            locationLabel.text = "정보없음"
        }else{
            locationLabel.text = store?.adr
        }
        if store?.wt == "x" {
            wtLabel.text = "정보없음"
        }else{
            wtLabel.text = store?.wt
        }
        if store?.phoneNumber == "x" {
            numberLabel.text = "정보없음"
        }else{
            numberLabel.text = store?.phoneNumber
        }
        if store?.bt == "x" {
            btLabel.text = "정보없음"
        }else{
            btLabel.text = store?.bt
        }
        imageView.pin_setImage(from: URL(string: (store?.photo1)!))
    }
    
    @objc func SwipeLeftImage(){
        if i<images.count-1{
            i+=1
            imageView.pin_setImage(from: URL(string: images[i]))
            // imageView.image=images[i]
        }else{}
    }
    @objc func SwipeRightImage(){
        if i<=images.count-1 && i>0{
            i-=1
            imageView.pin_setImage(from: URL(string: images[i]))
        }else{
        }
    }
    
    //하고싶으니까 물어보기!
    //    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    //        self.dismiss(animated: true, completion: nil)
    //        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
    //            imageView.contentMode = .scaleToFill
    //            imageView.image=nil
    //            images.insert(pickedImage, at: images.endIndex)
    //            imageView.image = pickedImage
    //        }
    //    }
    
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
            // 좋아요가 눌러졌는지 좋아요 버튼에 반영
            likeButton.isSelected = Liked.shared.isLiked(store)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func didTapDetail(_ sender: Any) {
        let Map = store?.map
        if let url = NSURL(string: Map!) {
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
