

import UIKit

class CategoryViewController: UIViewController {

 @IBOutlet weak var collectionView: UICollectionView!
    
    var Categories = [
        Category(name:"고기"), Category(name:"한식"),Category(name:"일식") ,Category(name:"중식")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        
    }
}
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
    
}
