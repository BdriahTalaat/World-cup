//
//  CreateAccountViewController.swift
//  World_Cup_matches
//
//  Created by Bdriah Talaat on 12/05/1444 AH.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import GoogleSignIn
import AuthenticationServices

class CreateAccountViewController: UIViewController{

    //MARK: OUTLETS
    @IBOutlet weak var userNameView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var confirmView: UIView!
    @IBOutlet weak var signUpView: UIView!
    @IBOutlet weak var signInWithGoogleButton: UIButton!
    @IBOutlet weak var signInViiew: UIView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var signInWithAppleButton: UIButton!
    @IBOutlet weak var confirmTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    //MARK: VARIABLE
    
    //MARK: LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmTextField.delegate = self
        
        userNameView.layer.cornerRadius = userNameView.frame.height/4
        passwordView.layer.cornerRadius = passwordView.frame.height/4
        emailView.layer.cornerRadius = emailView.frame.height/4
        confirmView.layer.cornerRadius = confirmView.frame.height/4
        signUpView.layer.cornerRadius = signUpView.frame.height/4

        signInViiew.isHidden = true
        signInWithAppleButton.isHidden = true
        signInWithGoogleButton.isHidden = true
    }
    
    //MARK: ACTIONS
    @IBAction func SignInButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        
        present(vc, animated: false)
    }
    
    @IBAction func SignUpButton(_ sender: Any) {
        
        let db = Firestore.firestore()
        
        if let fullName = nameTextField.text{
            if let email = emailTextField.text{
                if let password = passwordTextField.text{
                    if password.elementsEqual(confirmTextField.text!){
                        
                        Auth.auth().createUser(withEmail: email, password: password) { user, error in
                          
                            if user != nil {
                                
                                let vc = self.storyboard?.instantiateViewController(withIdentifier: "ComptitionViewController") as! ComptitionViewController
                                vc.user = true
                                self.present(vc, animated: false)
                                
                            }else{
                                if let Error = error{
                                    let alert = UIAlertController.init(title: "Error", message: "\(Error.localizedDescription)", preferredStyle: .alert)
                                    
                                    let OkAction = UIAlertAction(title: "OK", style: .default){ [self]_ in
                                        passwordTextField.text = ""
                                        confirmTextField.text = ""
                                        emailTextField.text = ""
                                        
                                    }
                                    alert.addAction(OkAction)
                                    self.present(alert, animated: false)
                                }
                            }
                            
                        }
                        
                    }else{
                        let alert = UIAlertController.init(title: "Error", message: "Make sure to verify the password", preferredStyle: .alert)
                        
                        let OkAction = UIAlertAction(title: "OK", style: .default){ [self]_ in
                            passwordTextField.text = ""
                            confirmTextField.text = ""
                        }
                        alert.addAction(OkAction)
                        present(alert, animated: false)
                    }
                }
            }
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: false)
    }
    
    @IBAction func signUpWithApple(_ sender: Any) {
     
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName,.email]
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.performRequests()
    }
    
    @IBAction func signUpWithGoogle(_ sender: Any) {
    }
}
//MARK: EXTENTION
extension CreateAccountViewController : ASAuthorizationControllerDelegate{
    func authorizationController (controller: ASAuthorizationController, didCompleteWithAuthorization authorization:ASAuthorization){
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential{
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email
            print("full name is \(fullName)")
        }
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print(error.localizedDescription)
    }
}
//MARK: EXTENTION
extension CreateAccountViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField{
            emailTextField.becomeFirstResponder()
        }else if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        }else if textField == passwordTextField{
            confirmTextField.becomeFirstResponder()
        }else{
            view.endEditing(true)
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
