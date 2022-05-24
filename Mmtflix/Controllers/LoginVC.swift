import UIKit
import FirebaseAuth

class LoginVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func loginButton(_ sender: Any) {
        
        if let email = emailTextField.text, let passsword = passwordTextField.text {
            
            Auth.auth().signIn(withEmail: email, password: passsword) { result, error in
                
                if error != nil {
                    
                    let alert = UIAlertController(title: "Error", message: error!.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Okey", style: .default))
                    self.present(alert, animated: true)
                }else {
                    
                    let controller = self.storyboard?.instantiateViewController(withIdentifier: "homeTab") as! UITabBarController
                    //controller.modalTransitionStyle = .flipHorizontal
                    controller.modalPresentationStyle = .fullScreen
                    self.present(controller, animated: true)
                }
            }
            
        }
    }
    
}
