import UIKit
import PINRemoteImage
class LikeTableViewController: UITableViewController {
    //var likeStores: [Store] = []
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Liked.shared.saves.count
    }
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "LikeCell", for: indexPath) as! LikeCell //이건 무조건 UITableViewCell을 돌려주기 때문에 우리가 강제로 타입변환을 해야한다
        let item = Liked.shared.saves[indexPath.row]
        //likeStores.append(item)
        print(item.name)
        cell.likeLabel.text = item.name
        cell.categoryLabel.text = item.category
        cell.likeImage.pin_setImage(from: URL(string: item.photo1))

        
        return cell
    }
  
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //셀하나의 세로길이
        return 80
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
  
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //likeStores.remove(at: indexPath.row)
        Liked.shared.saves.remove(at: indexPath.row)
        tableView.reloadData()
        //tableView.deleteRows(at: [indexPath], with: .automatic)
        /*
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }*/
    }
    
    
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let desVC = mainStoryboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
       desVC.store = Liked.shared.saves[indexPath.row]
//        desVC.Name = Liked.shared.saves[indexPath.row].name
//        print(likeStores[indexPath.row].name)
//        desVC.p1 = likeStores[indexPath.row].photo1
//
       // desVC.p1 = store?.photo1
   // desVC.Name = (store?.name)!
    //desVC.location = (store?.adr)!
     self.navigationController?.pushViewController(desVC, animated: true)
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
