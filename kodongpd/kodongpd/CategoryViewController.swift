

import UIKit

class CategoryViewController: UIViewController {
 @IBOutlet weak var imageView: UIImageView!
 @IBOutlet weak var collectionView: UICollectionView!
    //카테고리 배열
    var Categories = [
        Category(name:"고기"), Category(name:"한식"),Category(name:"일식") ,Category(name:"중식"),Category(name:"해물"),
        Category(name:"양식"), Category(name:"카페"),Category(name:"디저트") ,Category(name:"간편"),Category(name:"치킨"),Category(name:"기타")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
    //오늘 뭐먹지? 이미지뷰 밑의 선 보이기
        let borderLayer = CALayer()
        borderLayer.backgroundColor = UIColor.lightGray.cgColor
        borderLayer.frame = CGRect(x: 0, y: self.imageView.frame.height - 0.5, width: self.imageView.frame.width, height: 0.5)
        self.imageView.layer.addSublayer(borderLayer)
        
    }
}
//카테고리셀들 보여주기
extension CategoryViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Categories.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let pick = Categories[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        cell.layer.cornerRadius = 50
        cell.foodLabel.text = pick.name
        cell.foodImage.image = UIImage(named: pick.name)
        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CATEGORY_SEGUE"{
            if let detailVC = segue.destination as? StoreListViewController, let cell = sender as? UICollectionViewCell{
                let indexPath = collectionView.indexPath(for: cell)
                let pickCategory = Categories[indexPath!.row]
            //    detailVC.pickCategory = pickCategory
            }
        }
    }
    
}
