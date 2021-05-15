//
//  WelcomeViewController.swift
//  Alphametrica
//
//  Created by Ravi Ranjan on 14/05/21.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.hideKeyboardWhenTapped()
       // self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func registerAction(_ sender: Any) {
        let registerScene = RegisterViewController.instantiateFromAppStoryboard(appStoryboard: .Main)
        
        self.navigationController?.pushViewController(registerScene, animated: true)
    }
    
    @IBAction func loginAction(_ sender: Any) {
        let loginScene = LoginViewController.instantiateFromAppStoryboard(appStoryboard: .Main)
        
        self.navigationController?.pushViewController(loginScene, animated: true)

    }
    

}
