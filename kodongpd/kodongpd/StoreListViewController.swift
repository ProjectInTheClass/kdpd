import UIKit

class StoreListViewController: UIViewController {
    var category: Category?
    @IBOutlet weak var storeCollection: UICollectionView!
    
    var store = [
        Store(name: "a"),Store(name: "b"),Store(name: "c"),Store(name: "d"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storeCollection.dataSource = self
    }
}



extension StoreListViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return store.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let pick = store[indexPath.row]
        let cell = storeCollection.dequeueReusableCell(withReuseIdentifier: "StoreCell", for: indexPath) as! StoreCell
        
        cell.storeLabel.text = pick.name
        cell.storeImage.image = UIImage(named: pick.name)
        return cell
    }
}
