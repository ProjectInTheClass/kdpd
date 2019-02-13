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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = categoryName
        storeCollection.dataSource = self
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
            
            cell.storeLabel.text = selectStores[indexPath.row].name
            if pick.photo1 == "x"{
                cell.storeImage.image = UIImage(named: "d")
            }else{
                cell.storeImage.pin_setImage(from: URL(string: pick.photo1))
            }
            return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let desVC = mainStoryboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        desVC.store = selectStores[indexPath.row]
        self.navigationController?.pushViewController(desVC, animated: true)
    }
 
    
    func collectionView(_ collectionView: UICollectionView, layoutcollectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let cellsAcross: CGFloat = 2
        let spaceBetweenCells: CGFloat = 10
        let dim = (collectionView.bounds.width - (cellsAcross - 1) * spaceBetweenCells)/cellsAcross
        return CGSize(width: dim, height: dim)
        //return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
    

