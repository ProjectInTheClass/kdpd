import UIKit
import FirebaseDatabase
import PINRemoteImage //use cocopods
import SVProgressHUD

class StoreListViewController:  UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    var category: Category?
    
    var categoryName = "" //선택한 카테고리 이름 받아오기
    var selectStores: [Store] = [] //카테고리별 분류된 가게들
    
    @IBOutlet weak var storeCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storeCollection.dataSource = self
        
        //확인하기
        print("선택한 카테고리는",categoryName)
        
        //선택한 카테고리와 동일한 가게들 선택
        
        for i in 0 ... (stores.count - 1){
            if stores[i].category == categoryName {
                selectStores.append(stores[i])
            }
        }
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectStores.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let pick = selectStores[indexPath.row]
        let cell = storeCollection.dequeueReusableCell(withReuseIdentifier: "StoreCell", for: indexPath) as! StoreCell
        
        cell.storeLabel.text = pick.name
        
        if pick.photo1 == "x" || pick.photo1 == "n" || pick.photo1 == " " {
            cell.storeImage.image = UIImage(named: "d")
        }else{
            cell.storeImage.pin_setImage(from: URL(string: pick.photo1))
        }
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let desVC = mainStoryboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        desVC.Name = selectStores[indexPath.row].name
        desVC.location = selectStores[indexPath.row].adr
        desVC.phoneNum = selectStores[indexPath.row].phoneNumber
        desVC.WT = selectStores[indexPath.row].wt
        desVC.BT = selectStores[indexPath.row].bt
        desVC.Map = selectStores[indexPath.row].map
        
        self.navigationController?.pushViewController(desVC, animated: true)
    }
    
}
