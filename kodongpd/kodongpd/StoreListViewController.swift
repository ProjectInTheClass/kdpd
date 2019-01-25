import UIKit
import FirebaseDatabase
import PINRemoteImage //use cocopods
import SVProgressHUD

class StoreListViewController: UIViewController {
    var category: Category?
    @IBOutlet weak var storeCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storeCollection.dataSource = self
    }
}



extension StoreListViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stores.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let pick = stores[indexPath.row]
        let cell = storeCollection.dequeueReusableCell(withReuseIdentifier: "StoreCell", for: indexPath) as! StoreCell
        
        cell.storeLabel.text = pick.name
        
        if pick.photo1 == "x"{
            cell.storeImage.pin_setImage(from: URL(string: "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png"))        }else{
            cell.storeImage.pin_setImage(from: URL(string: pick.photo1))
        }
        return cell
    }
}
