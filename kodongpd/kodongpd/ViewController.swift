

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let ref = Database.database().reference()
        
       // ref.child("someid/name").setValue("Mike") //database에 있는 이름 바꾸기
        
        // ref.childByAutoId().setValue(["name":"Tom", "role":"Admin", "age":30]) //새로운 내용추가
        
        //읽어오기
        
         /* ref.child("someid/name").observeSingleEvent(of: .value){
         (snapshot) in
         let name = snapshot.value as? String
         print(name!)
         }*/
        /*ref.child("someid").observeSingleEvent(of: .value)
         {(snapshot) in
         let employeedata = snapshot.value as?
         [String:Any]
         print(employeedata)
            let em = employeedata!
         print(em["role"]!)
         }
        */
        //업데이트
        /*
         let updates = ["someid/name":"John", "-LWKOd5G6Iff7xsemjM0/name":"David"]
         ref.updateChildValues(updates)
         */
        //삭제
        //ref.child("-LWPDp8Y-SvbRFj031x2").removeValue()
       

    }


}




