//
//  UIViewController+Extensions.swift
//  Alphametrica
//
//  Created by Ravi Ranjan on 14/05/21.
//

import Foundation
import UIKit

extension UIViewController {

   
    func showToast(message : String) {
        //let toastLabel = UILabel(frame: CGRect(x: view.frame.size.width/2 - 150, y: view.frame.size.height-100, width: 300, height: 50))
        let toastLabel = UILabel()
        
        toastLabel.center = self.view.center
        toastLabel.backgroundColor = UIColor.init(named: "BASE_BACKGROUND")
        toastLabel.textColor = UIColor.init(named: "Text_Color")
        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        toastLabel.textAlignment = .center
        toastLabel.font = UIFont(name: "Lato-Regular", size: 30)
        // toastLabel.font = UIFont.boldSystemFont(ofSize: 30)
        
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds  =  true
        toastLabel.numberOfLines = 0
        view.addSubview(toastLabel)
        //toastLabel.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
        toastLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32).isActive = true
        
        toastLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        toastLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        UIView.animate(withDuration: 3.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    func showMessageVC(message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func hideKeyboardWhenTapped() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
  
    func getDateByFormatter(dateStr: String, df1: String, df2: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = df1
        let date = dateFormatter.date(from: dateStr)!
        dateFormatter.dateFormat = df2
        return dateFormatter.string(from: date)
    }
    

}
