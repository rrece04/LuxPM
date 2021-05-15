//
//  RegisterViewController.swift
//  Alphametrica
//
//  Created by Ravi Ranjan on 14/05/21.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var nameTF: SkyFloatingLabelTextField!
    @IBOutlet weak var phoneNoTF: SkyFloatingLabelTextField!
    @IBOutlet weak var dobTF: SkyFloatingLabelTextField!
    @IBOutlet weak var emailTF: SkyFloatingLabelTextField!
    @IBOutlet weak var passwordTF: SkyFloatingLabelTextField!
    @IBOutlet weak var confirmPassTF: SkyFloatingLabelTextField!
    @IBOutlet weak var termsButton: UIButton!
    @IBOutlet weak var charNoImgView: UIImageView!
    @IBOutlet weak var uppercaseCharImgView: UIImageView!
    @IBOutlet weak var numberImgView: UIImageView!
    @IBOutlet weak var specialCharImgView: UIImageView!
    
    var passwordSyntax = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
        self.hideKeyboardWhenTapped()
        self.doInitialSettings()
    }
    
    func doInitialSettings() {
        dobTF.addInputViewDatePicker(target: self, selector: #selector(doneButtonPressed))
        phoneNoTF.keyboardType = .numberPad
        emailTF.keyboardType = .emailAddress
        passwordTF.isSecureTextEntry = true
        confirmPassTF.isSecureTextEntry = true
        termsButton.isSelected = false
    }
    
    
    // MARK: - Navigation
    
    @IBAction func registerAction(_ sender: Any) {
        
        if nameTF.text!.isEmpty {
            self.showMessageVC(message: StringConstants.knameEmpty)
        } else if phoneNoTF.text!.isEmpty {
            self.showMessageVC(message: StringConstants.kphoneEmpty)
        } else if phoneNoTF.text!.count < 9 {
            self.showMessageVC(message: StringConstants.kphoneError)
        } else if dobTF.text!.isEmpty {
            self.showMessageVC(message: StringConstants.kdobEmpty)
        } else if emailTF.text!.isEmpty {
            self.showMessageVC(message: StringConstants.kemailEmpty)
       } else if !emailTF.text!.isValidEmail {
        self.showMessageVC(message: StringConstants.kemailError)
       }
       else if passwordTF.text!.isEmpty {
        self.showMessageVC(message: StringConstants.kpasswordEmpty)
      } else if !passwordSyntax {
        self.showMessageVC(message: StringConstants.kpasswordError)
      } else if passwordTF.text! != confirmPassTF.text! {
        self.showMessageVC(message: StringConstants.kpassMatchError)
      } else if !termsButton.isSelected {
        self.showMessageVC(message: StringConstants.ktermsError)
      } else {
        let homeScene = HomeViewController.instantiateFromAppStoryboard(appStoryboard: .Main)
        self.navigationController?.pushViewController(homeScene, animated: true)
      }
        
    }
    
    
    @IBAction func termsAction(_ sender: UIButton) {
        if sender.isSelected == true {
            sender.isSelected = false
            sender.backgroundColor = UIColor.init(named: "Color_Placeholder")
          }else {
            sender.isSelected = true
            sender.backgroundColor = UIColor.init(named: "Color_Button")
          }
    }
    
    
    @IBAction func loginAction(_ sender: Any) {
        
        if (self.navigationController?.containsViewController(ofKind: LoginViewController.self))! {
            if let vc = self.navigationController?.viewControllers.last(where: { $0.isKind(of: LoginViewController.self) }) {
                self.navigationController!.popToViewController(vc, animated: true)
            }
        } else {
            
            let loginScene = LoginViewController.instantiateFromAppStoryboard(appStoryboard: .Main)
            
            self.navigationController?.pushViewController(loginScene, animated: true)
        }
        
        
    }
    
    @objc func doneButtonPressed() {
        if let  datePicker = self.dobTF.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            self.dobTF.text = dateFormatter.string(from: datePicker.date)
        }
        self.dobTF.resignFirstResponder()
    }
    
}


extension RegisterViewController : UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == phoneNoTF {
            if(string == "\n") {
                textField.resignFirstResponder()
                return false
            } else if !string.isEmpty {
                guard let text = textField.text else { return true }
                textField.text = text.applyPatternOnNumbers(pattern: "### ### ####", replacmentCharacter: "#")
            }
            
        }
        

        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        var numberofCharacters = 0
        var lowerCaseLetter: Bool = false
        var upperCaseLetter: Bool = false
        var digit: Bool = false
        var specialCharacter = Bool(0)
        
        if textField == passwordTF {
            
            
            if !textField.text!.isEmpty {
                for c in textField.text! {
                    
                    if !lowerCaseLetter {
                        lowerCaseLetter = c.isLowerCase()
                    }
                    if !upperCaseLetter {
                        upperCaseLetter = c.isUpperCase()
                    }
                    if !digit {
                        digit = c.isDigit()
                    }
                    if !specialCharacter {
                        specialCharacter = textField.text!.hasSpecialCharacters()
                    }
                    
                    
                    if textField.text!.count >= 8 {
                        charNoImgView.image = UIImage.init(named: "sel")
                    } else {
                        charNoImgView.image = UIImage.init(named: "unsel")
                    }
                    
                    if digit {
                        numberImgView.image = UIImage.init(named: "sel")
                    } else {
                        numberImgView.image = UIImage.init(named: "unsel")
                    }
                    
                    if upperCaseLetter {
                        uppercaseCharImgView.image = UIImage.init(named: "sel")
                    } else {
                        uppercaseCharImgView.image = UIImage.init(named: "unsel")
                    }
                    
                    if specialCharacter {
                        specialCharImgView.image = UIImage.init(named: "sel")
                    } else {
                        specialCharImgView.image = UIImage.init(named: "unsel")
                    }
                    
                    if textField.text!.count >= 8 && digit && upperCaseLetter && specialCharacter {
                        passwordSyntax = true
                    } else {
                        passwordSyntax = false
                    }
                    
                }
                
            }
            
            
            
        }
        
    }
}
