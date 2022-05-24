import UIKit
import FirebaseAuth

class SigninVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func createButton(_ sender: Any) {
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                
                if error != nil {
                    let alert = UIAlertController(title: "Error", message: error!.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Okey", style: .default))
                    self.present(alert, animated: true)
                }else {
                    
                    let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                    changeRequest?.displayName = self.usernameTextField.text ?? ""
                    changeRequest?.commitChanges(completion: { error in
                        print(error?.localizedDescription ?? "")
                    })
                    
                    self.navigationController?.popToRootViewController(animated: true)
                }
                
            }
        }
    }
    
}
