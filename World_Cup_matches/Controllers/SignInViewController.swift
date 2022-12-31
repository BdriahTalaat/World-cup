//
//  SignInViewController.swift
//  World_Cup_matches
//
//  Created by Bdriah Talaat on 13/05/1444 AH.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class SignInViewController: UIViewController {

    //MARK: OUTLETS
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var SignInView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    //MARK: LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        passwordView.layer.cornerRadius = passwordView.frame.height/4
        emailView.layer.cornerRadius = emailView.frame.height/4
        SignInView.layer.cornerRadius = SignInView.frame.height/4
    }
    
    //MARK: ACTIONS
    @IBAction func signInButton(_ sender: Any) {
        let db = Firestore.firestore()
        
        if let email = emailTextField.text{
            if let password = passwordTextField.text{
               
                Auth.auth().signIn(withEmail: email, password: password) { user, error in
                  
                    if user != nil {
                        
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ComptitionViewController") as! ComptitionViewController
                        vc.user = true
                        self.present(vc, animated: false)
                        
                    }else{
                        if let Error = error?.localizedDescription {
                            let alert = UIAlertController.init(title: "Error", message: "\(Error)", preferredStyle: .alert)
                            
                            let OkAction = UIAlertAction(title: "OK", style: .default){ [self]_ in
                                passwordTextField.text = ""
                                emailTextField.text = ""
                                
                            }
                            alert.addAction(OkAction)
                            self.present(alert, animated: false)
                           
                        }
                    }
                    
                }
            }
        }
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "CreateAccountViewController") as! CreateAccountViewController
        
        present(vc, animated: false)
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: false)
    }
}
//MARK: EXTENTION
extension SignInViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField{
            passwordTextField.becomeFirstResponder()
        }else{
            view.endEditing(true)
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
