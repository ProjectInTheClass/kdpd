import UIKit
import SVProgressHUD

class CategoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    //카테고리 콜렉션 뷰
    @IBOutlet weak var collectionView: UICollectionView!
    
    //카테고리 배열
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
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
    
    func collectionView(_ collectionView: UICollectionView, layoutcollectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let cellsAcross: CGFloat = 4
        let spaceBetweenCells: CGFloat = 10
        let dim = (view.bounds.width - (cellsAcross - 1) * spaceBetweenCells)/cellsAcross
        return CGSize(width: dim, height: dim)
        //return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    
    }
}
