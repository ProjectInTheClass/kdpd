
import UIKit
import PINRemoteImage

class DetailViewController: UIViewController, UIDocumentInteractionControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var storeLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var wtLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var btLabel: UILabel!
    @IBOutlet weak var naverButton: UIButton!
    @IBOutlet weak var areaLabel: UILabel!
   // @IBOutlet weak var scrollView: UIScrollView! 스와이프 할라면 UIScrollViewDelegate추가
    
    @IBOutlet weak var first: UIImageView!
    @IBOutlet weak var second: UIImageView!
    
    
    var store: Store?
    
    
    //사진
    var images: [String] = []
    var i = Int()
    
    fileprivate var documentController: UIDocumentInteractionController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = store?.name
        if store?.photo2 == "x"{
            images.append((store?.photo1)!)
            second.isHidden = true
        }else{
            images.append((store?.photo1)!)
            images.append((store?.photo2)!)
            
        }
//        scrollView.alwaysBounceVertical = false
//        scrollView.alwaysBounceHorizontal = false
//
//        scrollView.minimumZoomScale = 1.0
//        scrollView.maximumZoomScale = 2.0
//        scrollView.delegate = self
        
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
            numberLabel.textColor = UIColor.blue
            numberLabel.text = store?.phoneNumber
        }
        if store?.Area == "x" {
            areaLabel.isHidden = true
        }else if store?.Area == "3"{
            store?.Area = "남산골"
            areaLabel.text = (store?.Area)! + "근처"
        }
        else{
            areaLabel.text = (store?.Area)! + "근처"
        }
        if store?.bt == "x" {
            btLabel.text = "정보없음"
        }else{
            btLabel.text = store?.bt
        }
        imageView.pin_setImage(from: URL(string: (store?.photo1)!))
    }
//    @available(iOS 2.0, *)
//    public func viewForZooming(in scrollView: UIScrollView) ->UIView
//    {
//        return self.imageView
//    }
    
    @objc func SwipeLeftImage(){
        if i<images.count-1{
            i+=1
            imageView.pin_setImage(from: URL(string: images[i]))
            first.isHighlighted = true
            second.isHighlighted = true
        }else{}
    }
    @objc func SwipeRightImage(){
        if i<=images.count-1 && i>0{
            i-=1
            imageView.pin_setImage(from: URL(string: images[i]))
            second.isHighlighted = false
            first.isHighlighted = false
        }else{}
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
    
    @IBAction func shareKakao(_ sender: Any) {
        // Feed 타입 템플릿 오브젝트 생성
        let template = KMTFeedTemplate { (feedTemplateBuilder) in
            
            // 컨텐츠
            feedTemplateBuilder.content = KMTContentObject(builderBlock: { (contentBuilder) in
                contentBuilder.title = "오늘 \"\((self.store?.name)!)\" 어때요?"
                contentBuilder.desc = "#충무로 #\((self.store?.category)!)"
                contentBuilder.imageURL = URL(string: "\((self.store?.photo1)!)")!
                contentBuilder.link = KMTLinkObject(builderBlock: { (linkBuilder) in
                    linkBuilder.mobileWebURL = URL(string: "https://developers.kakao.com")
                })
            })
            
            // 소셜
            /*feedTemplateBuilder.social = KMTSocialObject(builderBlock: { (socialBuilder) in
             socialBuilder.likeCount = 286
             socialBuilder.commnentCount = 45
             socialBuilder.sharedCount = 845
             })*/
            
            // 버튼
            /*feedTemplateBuilder.addButton(KMTButtonObject(builderBlock: { (buttonBuilder) in
             buttonBuilder.title = "웹으로 보기"
             buttonBuilder.link = KMTLinkObject(builderBlock: { (linkBuilder) in
             linkBuilder.mobileWebURL = URL(string: "https://www.naver.com/")
             })
             }))*/
            feedTemplateBuilder.addButton(KMTButtonObject(builderBlock: { (buttonBuilder) in
                buttonBuilder.title = "앱으로 보기"
                buttonBuilder.link = KMTLinkObject(builderBlock: { (linkBuilder) in
                    linkBuilder.iosExecutionParams = "param1=value1&param2=value2"
                    //   linkBuilder.androidExecutionParams = "param1=value1&param2=value2"
                })
            }))
        }
        
        // 서버에서 콜백으로 받을 정보
        let serverCallbackArgs = ["user_id": "abcd",
                                  "product_id": "1234"]
        
        // 카카오링크 실행
        KLKTalkLinkCenter.shared().sendDefault(with: template, serverCallbackArgs: serverCallbackArgs, success: { (warningMsg, argumentMsg) in
            
            // 성공
            print("warning message: \(String(describing: warningMsg))")
            print("argument message: \(String(describing: argumentMsg))")
            
        }, failure: { (error) in
            
            // 실패
            //UIAlertController.showMessage(error.localizedDescription)
            print("error \(error)")
            
        })

    }
    
    @IBAction func call(_ sender: Any) {
        let url: NSURL = URL(string: "TEL://\((store?.phoneNumber)!)")! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
    
}
