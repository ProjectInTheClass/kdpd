
import UIKit
import Foundation
import PINRemoteImage
class RandomViewController: UIViewController {
    
    @IBOutlet weak var replayButton: UIButton!
    @IBOutlet weak var detailButton: UIButton!
    @IBOutlet weak var storeCategory: UILabel!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var store: Store?
    
    var currentImageIndex = 0
    var images: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        replayButton.layer.cornerRadius = 5
        detailButton.layer.cornerRadius = 5
        replayButton.layer.borderWidth = 0.3
        detailButton.layer.borderWidth = 0.3
        
        //오늘 뭐 먹지?는 앱 로딩후 3초 뒤에 눌러야 오류가 없다.(그래서 로딩중 넣음)
        //랜덤
        let c = ForRec.count-1
        let num = Int(arc4random_uniform(UInt32(c)))
        //추천가게 인덱스
        id = num
        
        //버튼, 이미지 인덱스 초기화
        currentImageIndex = 0
        //        leftButton.isEnabled = false
        //        rightbutton.isEnabled = true
        
        //이미지 초기화
        images = []
        images.append(ForRec[num].photo1)
        images.append(ForRec[num].photo2)
        
        //확인창. 나중에 삭제할 것
        print("num은", num)
        print ("forrec개수는", ForRec.count)
        print("viewimage개수는", images.count)
        
        //정보 나타내기
        store = ForRec[num]
        storeName.text = ForRec[num].name
        storeCategory.text = ForRec[num].category
        titleLabel.text = "오늘 "+(store?.name)!+" 어때요?"
        foodImage.pin_setImage(from: URL(string: "\(ForRec[num].photo1)"))
        
        
        replayButton.addTarget(self, action: #selector(againRec(_:)), for: .touchUpInside)
        detailButton.addTarget(self, action: #selector(detailGo(_:)), for: .touchUpInside)
    }
    
    
    @IBAction func detailGo(_ sender: Any) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let desVC = mainStoryboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        desVC.store = store
        self.navigationController?.pushViewController(desVC, animated: true)
    }
    
    
    @IBAction func againRec(_ sender: Any) {
        images = []
        viewDidLoad()
    }
    
    
    
    func showImage(index: Int) {
        
        let imageUrl = images[index]
        if imageUrl == "x" || imageUrl == "n" {
            foodImage.image = UIImage(named: "d")
        }else{
            foodImage.pin_setImage(from: URL(string: imageUrl))
            
        }
        
        //        // 좌/우 이미지 이동이 불가능한 상태면 버튼 상태를 disabled로
        //        leftButton.isEnabled = index > 0
        //        rightbutton.isEnabled = index < images.count - 1
    }
    
    
    
}
