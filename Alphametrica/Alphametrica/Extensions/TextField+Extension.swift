//
//  TextField+Extension.swift
//  Alphametrica
//
//  Created by Ravi Ranjan on 13/05/21.
//

import Foundation
import UIKit

extension UITextField {
    /// Moves the caret to the correct position by removing the trailing whitespace
    func fixCaretPosition() {
        // Moving the caret to the correct position by removing the trailing whitespace
        // http://stackoverflow.com/questions/14220187/uitextfield-has-trailing-whitespace-after-securetextentry-toggle

        let beginning = beginningOfDocument
        selectedTextRange = textRange(from: beginning, to: beginning)
        let end = endOfDocument
        selectedTextRange = textRange(from: end, to: end)
    }
    
      func addInputViewDatePicker(target: Any, selector: Selector) {

       let screenWidth = UIScreen.main.bounds.width

       //Add DatePicker as inputView
       let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 216))
       datePicker.datePickerMode = .date
       self.inputView = datePicker
        datePicker.preferredDatePickerStyle = .wheels
       //Add Tool Bar as input AccessoryView
       let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 44))
       let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
       let cancelBarButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelPressed))
       let doneBarButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: selector)
       toolBar.setItems([cancelBarButton, flexibleSpace, doneBarButton], animated: false)

       self.inputAccessoryView = toolBar
    }

      @objc func cancelPressed() {
        self.resignFirstResponder()
      }
   
}
