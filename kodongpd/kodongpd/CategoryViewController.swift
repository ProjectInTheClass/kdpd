import UIKit
import SVProgressHUD

class CategoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    //카테고리 콜렉션 뷰
    @IBOutlet weak var collectionView: UICollectionView!
    
    //카테고리 배열
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
       // collectionView.layer.cornerRadius = 5

    }
    override func viewWillAppear(_ animated: Bool) {
        //네비게이션 바 꾸미기
        //        let shadow = NSShadow()
        //        shadow.shadowOffset = CGSize(width: 0.4, height: 0.3)
        //        shadow.shadowBlurRadius = 0.2
        //        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.orange, NSAttributedString.Key.shadow : shadow]
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.orange,
             NSAttributedString.Key.font: UIFont(name: "Binggrae", size: 21)!]
    }
    
//카테고리셀들 보여주기
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Categories.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        cell.layer.cornerRadius = 5
        cell.foodLabel.text = Categories[indexPath.row].name
        cell.foodImage.image = UIImage(named: Categories[indexPath.row].image)
        return cell
        
    }
    //카테고리 선택했을 때 다음 컨트롤뷰로 선택한 카테고리 전달
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let desVC = mainStoryboard.instantiateViewController(withIdentifier: "StoreListViewController") as! StoreListViewController
        desVC.categoryName = Categories[indexPath.row].name
        self.navigationController?.pushViewController(desVC, animated: true)
    }
}
