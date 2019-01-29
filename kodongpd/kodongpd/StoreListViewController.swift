import UIKit
import FirebaseDatabase
import PINRemoteImage //use cocopods
import SVProgressHUD

class StoreListViewController:  UIViewController,UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate {
    var category: Category?
    
    var categoryName = "" //선택한 카테고리 이름 받아오기
    var selectStores: [Store] = [] //카테고리별 분류된 가게들
    var count = stores.count-1
    
    var searchStores : [Store] = []//찾는 가게를 담는 배열
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
        
        //검색을 위한
        searchStores = selectStores
        searchBar.delegate = self
        searchBar.placeholder = "가게 검색"
        
        
    }
    //검색바 검색
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        searchStores = selectStores.filter({ SF-> Bool in
            
          guard let text = searchBar.text else {return false}
            if searchText.isEmpty{return true}
            return SF.name.contains(text)
            
        })
        searching = true
        storeCollection.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searching{
            return searchStores.count
        }
        return selectStores.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if searching{
            
            let pick = searchStores[indexPath.row]
            let cell = storeCollection.dequeueReusableCell(withReuseIdentifier: "StoreCell", for: indexPath) as! StoreCell
            
            cell.storeLabel.text = searchStores[indexPath.row].name
            cell.layer.borderWidth = 0.5
            cell.layer.cornerRadius=10
            if pick.photo1 == "x" || pick.photo1 == "n" || pick.photo1 == " " {
                cell.storeImage.image = UIImage(named: "d")
            }else{
                cell.storeImage.pin_setImage(from: URL(string: searchStores[indexPath.row].photo1))
            }
            
            return cell
            
        }else{
            
            let pick = selectStores[indexPath.row]
            let cell = storeCollection.dequeueReusableCell(withReuseIdentifier: "StoreCell", for: indexPath) as! StoreCell
            
            cell.storeLabel.text = selectStores[indexPath.row].name
            cell.layer.borderWidth = 0.5
            cell.layer.cornerRadius=10
            if pick.photo1 == "x" || pick.photo1 == "n" || pick.photo1 == " " {
                cell.storeImage.image = UIImage(named: "d")
            }else{
                cell.storeImage.pin_setImage(from: URL(string: pick.photo1))
            }
            
            return cell
        }
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
    

