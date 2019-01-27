
import UIKit
import MessageUI

class SSendEmailTableViewController: UITableViewController, MFMailComposeViewControllerDelegate {
    @IBOutlet weak var sendButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        sendButton.layer.cornerRadius = 5
    }
    
    @IBAction func sendEmail(_ sender: Any) {
        if let url = NSURL(string: "https://goo.gl/forms/7YpZ7QUZhRDwjY1K2") {
            UIApplication.shared.open(url as URL)
        }
    }
  
    
}
