//
//  MainViewController.swift
//  World_Cup_matches
//
//  Created by Bdriah Talaat on 12/05/1444 AH.
//

import UIKit

class MainViewController: UIViewController {

    //MARK: OUTLETS
    @IBOutlet weak var signInView: UIView!
    @IBOutlet weak var newAccountView: UIView!

    //MARK: LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()

        newAccountView.layer.cornerRadius = newAccountView.frame.height/4
        signInView.layer.cornerRadius = signInView.frame.height/4
    }
   
    //MARK: ACTIONS
    @IBAction func skipButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ComptitionViewController") as! ComptitionViewController
        present(vc, animated: false)
    }
    
    @IBAction func newAccountButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "CreateAccountViewController") as! CreateAccountViewController
        present(vc, animated: false)
    }
    
    @IBAction func signInButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        
        present(vc, animated: false)
    }
    
}
