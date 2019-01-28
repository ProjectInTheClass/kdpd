import UIKit
import FirebaseDatabase
import PINRemoteImage //use cocopods
import SVProgressHUD

class StoreListViewController:  UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    var category: Category?
    
    var categoryName = "" //선택한 카테고리 이름 받아오기
    var selectStores: [Store] = [] //카테고리별 분류된 가게들
    var count = stores.count-1
    
    var selectStoresNames = [String]()//카테고리별 분류된 가게의 이름들
    var searchStores = [String]()//찾는 가게를 담는 배열
    var searching = false
    
    @IBOutlet weak var storeCollection: UICollectionView!
    @IBOutlet var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = categoryName
        storeCollection.dataSource = self
        
        //확인하기
        //print("선택한 카테고리는",categoryName)
        
        //선택한 카테고리와 동일한 가게들 선택
        for i in 0 ... (stores.count - 1){
            if stores[i].category == categoryName {
                selectStores.append(stores[i])
            }
        }
        for i in 0 ... (selectStores.count - 1){
            selectStoresNames.append(selectStores[i].name)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searching{
            return searchStores.count
        }
        return selectStores.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let pick = selectStores[indexPath.row]
        let cell = storeCollection.dequeueReusableCell(withReuseIdentifier: "StoreCell", for: indexPath) as! StoreCell
        
        if searching{
            cell.storeLabel.text = searchStores[indexPath.row]
            
        }else{
            cell.storeLabel.text = selectStoresNames[indexPath.row]
        }
        
        if pick.photo1 == "x" || pick.photo1 == "n" || pick.photo1 == " " {
            cell.storeImage.image = UIImage(named: "d")
        }else{
            cell.storeImage.pin_setImage(from: URL(string: pick.photo1))
        }
        cell.layer.cornerRadius = 5
        cell.layer.borderWidth = 0.5
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let desVC = mainStoryboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        desVC.store = selectStores[indexPath.row]
//        desVC.Name = selectStores[indexPath.row].name
//        desVC.location = selectStores[indexPath.row].adr
//        desVC.phoneNum = selectStores[indexPath.row].phoneNumber
//        desVC.WT = selectStores[indexPath.row].wt
//        desVC.BT = selectStores[indexPath.row].bt
//        desVC.Map = selectStores[indexPath.row].map
//        desVC.p1 = selectStores[indexPath.row].photo1
//        desVC.p2 = selectStores[indexPath.row].photo2
        
        self.navigationController?.pushViewController(desVC, animated: true)
    }
    
}
extension StoreListViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchStores = selectStoresNames.filter({$0.prefix(searchText.count) == searchText})
        searching = true
        storeCollection.reloadData()
    }
    
}
