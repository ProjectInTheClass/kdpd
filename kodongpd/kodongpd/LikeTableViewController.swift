import UIKit
import PINRemoteImage
class LikeTableViewController: UITableViewController {
    var store: Store?
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
        if item.Area == "x" {
            item.Area = ""
        }else if item.Area == "3"{
            item.Area = "남산골" + " 근처"
        }
        else{
            item.Area = item.Area + " 근처"
        }
        let area = " / " + item.Area
        let string  = item.category + area
        cell.likeLabel.text = item.name
        cell.categoryLabel.text = string
        cell.likeImage.pin_setImage(from: URL(string: item.photo1))
        return cell
    }
  
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //셀하나의 세로길이
        return 80
    }
  
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
     self.navigationController?.pushViewController(desVC, animated: true)
    }

}
