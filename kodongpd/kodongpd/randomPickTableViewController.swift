import UIKit
import Foundation
import PINRemoteImage

class randomPickTableViewController: UITableViewController {

    
    @IBOutlet weak var storeCategory: UILabel!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightbutton: UIButton!
    @IBOutlet weak var foodImage: UIImageView!
   
    //사진
    var currentImageIndex = 0
    var images: [String] = []
    
    
    @IBAction func showNextImage(_ sender: Any) {
        currentImageIndex += 1
        self.showImage(index: currentImageIndex)
        print("nextimage개수는", images.count)

    }
    
    @IBAction func showPreImage(_ sender: Any) {
        currentImageIndex -= 1
        self.showImage(index: currentImageIndex)
        print("preimage개수는", images.count)
    }
    
    func showImage(index: Int) {
        
        let imageUrl = images[index]
        if imageUrl == "x" || imageUrl == "n" {
            foodImage.image = UIImage(named: "d")
        }else{
            
            foodImage.pin_setImage(from: URL(string: imageUrl))
            
        }
       
        // 좌/우 이미지 이동이 불가능한 상태면 버튼 상태를 disabled로
        leftButton.isEnabled = index > 0
        rightbutton.isEnabled = index < images.count - 1
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //오늘 뭐 먹지?는 앱 로딩후 3초 뒤에 눌러야 오류가 없다.(그래서 로딩중 넣음)
        //랜덤
        let c = ForRec.count-1
        let num = Int(arc4random_uniform(UInt32(c)))
        //추천가게 인덱스
        id = num
        
        //버튼, 이미지 인덱스 초기화
        currentImageIndex = 0
        leftButton.isEnabled = false
        rightbutton.isEnabled = true
        
        //이미지 초기화
        images = []
        images.append(ForRec[num].photo1)
        images.append(ForRec[num].photo2)
        
        //확인창. 나중에 삭제할 것
        print("num은", num)
        print ("forrec개수는", ForRec.count)
        print("viewimage개수는", images.count)
        
        //정보 나타내기
        storeName.text = ForRec[num].name
        storeCategory.text = ForRec[num].category
        foodImage.pin_setImage(from: URL(string: "\(ForRec[num].photo1)"))

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return 4
    }

    
    @IBAction func againRec(_ sender: Any) {
      images = []
        viewDidLoad()
        
    }
    
}
