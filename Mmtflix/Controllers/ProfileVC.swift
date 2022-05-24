import UIKit
import FirebaseAuth

class ProfileVC: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var displayNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let user = Auth.auth().currentUser {
            displayNameLabel.text = user.displayName!
            emailLabel.text = user.email!
        }
    }
    
    @IBAction func logOutBttuon(_ sender: Any) {
        
        do{
            try Auth.auth().signOut()
            
            let controller = storyboard?.instantiateViewController(withIdentifier: "loginVC") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            present(controller, animated: true)
            
        }catch {
            print(error.localizedDescription)
        }
            
    }
    

}
