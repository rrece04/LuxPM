//
//  LoginViewController.swift
//  Alphametrica
//
//  Created by Ravi Ranjan on 14/05/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    let username = "test@luxpmsoft.com"
    let password = "test1234!"
    
    @IBOutlet weak var emailTF: SkyFloatingLabelTextFieldWithIcon!
    
    @IBOutlet weak var passwordTF: SkyFloatingLabelTextFieldWithIcon!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.hideKeyboardWhenTapped()
        passwordTF.isSecureTextEntry = true        
    }
    
    // MARK: - Navigation

    @IBAction func forgotPassAction(_ sender: UIButton) {
        self.showMessageVC(message: "진행중인 작업. 비밀번호 분실로 이동")
    }
    
    @IBAction func loginAction(_ sender: Any) {
        if emailTF.text == username && passwordTF.text == password {
            let homeScene = HomeViewController.instantiateFromAppStoryboard(appStoryboard: .Main)
            self.navigationController?.pushViewController(homeScene, animated: true)
            
        } else if emailTF.text != username {
            self.showMessageVC(message: "잘못된 이메일")
        } else if passwordTF.text != password {
            self.showMessageVC(message: "잘못된 비밀번호")
        }
    }
    
    @IBAction func registerAction(_ sender: Any) {
        if (self.navigationController?.containsViewController(ofKind: RegisterViewController.self))! {
            if let vc = self.navigationController?.viewControllers.last(where: { $0.isKind(of: RegisterViewController.self) }) {
                self.navigationController!.popToViewController(vc, animated: true)
            }
        } else {
            
            let registerScene = RegisterViewController.instantiateFromAppStoryboard(appStoryboard: .Main)
            
            self.navigationController?.pushViewController(registerScene, animated: true)
        }
    }
    
    
    
}
