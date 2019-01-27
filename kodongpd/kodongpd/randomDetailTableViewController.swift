import UIKit
import PINRemoteImage
import SVProgressHUD

class randomDetailTableViewController: UITableViewController {

    @IBOutlet weak var foodImage: UIImageView!
    
    @IBOutlet weak var storeBT: UILabel!
    @IBOutlet weak var storeWT: UILabel!
    @IBOutlet weak var storeadr: UILabel!
    @IBOutlet weak var storeNum: UILabel!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    var map = ""
   //추천가게
  var choice = ForRec[id]
  var images = [ForRec[id].photo1, ForRec[id].photo2]
  var currentImageIndex = 0
    
    @IBAction func showLeftImage(_ sender: Any) {
        currentImageIndex -= 1
        self.showImage(index: currentImageIndex)
    }
    @IBAction func showNextImage(_ sender: Any) {
        currentImageIndex += 1
        self.showImage(index: currentImageIndex)
    }
    func showImage(index: Int) {
        let imageUrl = images[index]
        foodImage.pin_setImage(from: URL(string: "\(imageUrl)"))
        
        // 좌/우 이미지 이동이 불가능한 상태면 버튼 상태를 disabled로
        leftButton.isEnabled = index > 0
        rightButton.isEnabled = index < images.count - 1
    }
    //시작
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 초기 이미지는 첫번째 이미지이므로 왼쪽 버튼은 disabled로
        leftButton.isEnabled = false
        
        foodImage.pin_setImage(from: URL(string: images[0]))
        storeName.text = ForRec[id].name
        storeBT.text = ForRec[id].bt
        storeWT.text = ForRec[id].wt
        storeadr.text = ForRec[id].adr
        storeNum.text = ForRec[id].phoneNumber
        map = ForRec[id].map
        
    }
    
    //네이버 지도로
    @IBAction func goToDetail(_ sender: Any) {
        if let url = NSURL(string: map) {
            if map == "x"{
                let MapErrorAlert = UIAlertController(title: "알림", message: "네이버 지도 정보가 없습니다.", preferredStyle: .alert)
                let dism = UIAlertAction(title: "Ok", style: .default, handler: nil)
                MapErrorAlert.addAction(dism)
                self.present(MapErrorAlert, animated: true, completion: nil)
                
            }else{
                UIApplication.shared.open(url as URL)
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

}
