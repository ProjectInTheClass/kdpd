import UIKit
import MessageUI

class sendEmailTableViewController: UITableViewController,  MFMailComposeViewControllerDelegate  {
    @IBOutlet weak var text: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        text.layer.borderWidth = 1
        text.layer.masksToBounds = true
        text.layer.cornerRadius = 5
        sendButton.layer.cornerRadius = 5
    }
    
    @IBAction func sendEmail(_ sender: Any) {
        if let url = NSURL(string: "https://goo.gl/forms/d5RJAUo8kjI5CMIs2") {
                UIApplication.shared.open(url as URL)
        }
    }
  
    
    
}
