
import UIKit

class MoreTableViewController: UITableViewController {

    @IBAction func showRequestAdver(_ sender: Any) {
        if let url = NSURL(string: "https://goo.gl/forms/7YpZ7QUZhRDwjY1K2") {
            UIApplication.shared.open(url as URL)
        }
    }
    @IBAction func showRequestStore(_ sender: Any) {
        if let url = NSURL(string: "https://goo.gl/forms/d5RJAUo8kjI5CMIs2") {
            UIApplication.shared.open(url as URL)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

  
}
