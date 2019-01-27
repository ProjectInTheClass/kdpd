import UIKit

class PickViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var againButton: UIButton!
    @IBOutlet weak var goButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        againButton.layer.cornerRadius = 5
        goButton.layer.cornerRadius = 5
    }
}




