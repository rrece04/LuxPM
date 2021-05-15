//
//  String+Extensions.swift
//  Alphametrica
//
//  Created by Ravi Ranjan on 15/05/21.
//

import Foundation


extension String {
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    var isValidPasword: Bool {
        
        //Minimum 8 characters at least 1 Uppercase Alphabet, 1 Lowercase Alphabet and 1 Number:
        
        let regularExpressionForPhone = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$"
        
        let testPhone = NSPredicate(format:"SELF MATCHES %@", regularExpressionForPhone)
        return testPhone.evaluate(with: self)
    }
    var isValidPhoneNumber:Bool{
        let regularExpressionForPhone = "^\\d{3}-\\d{3}-\\d{4}$"
        let testPhone = NSPredicate(format:"SELF MATCHES %@", regularExpressionForPhone)
        return testPhone.evaluate(with: self)
    }
    
    var isValidName: Bool {
        let predicateTest = NSPredicate(format: "SELF MATCHES %@", "^(([^ ]?)(^[a-zA-Z].*[a-zA-Z]$)([^ ]?))$")
        return predicateTest.evaluate(with: self)
    }
    
    var characters8Check: Bool {
       
        let passwordPred = NSPredicate(format: "SELF MATCHES %@", "^{8,}$")
        return passwordPred.evaluate(with: self)
    }
    var oneUppercaseCheck: Bool {
       
        let passwordPred = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Z])$")
        return passwordPred.evaluate(with: self)
    }
    var numberCharCheck: Bool {
       
        let passwordPred = NSPredicate(format: "SELF MATCHES %@", "^[0-9]+$")
        return passwordPred.evaluate(with: self)
    }
    var specialCharCheck: Bool {
       
        let passwordPred = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[!@#$&*])$")
        return passwordPred.evaluate(with: self)
    }
    
    
    
    var isPhoneNumber: Bool {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: self, options: [], range: NSRange(location: 0, length: self.count))
            if let res = matches.first {
                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.count
            } else {
                return false
            }
        } catch {
            return false
        }
    }
    
    
    func applyPatternOnNumbers(pattern: String, replacmentCharacter: Character) -> String {
        var pureNumber = self.replacingOccurrences( of: "[^0-9]", with: "", options: .regularExpression)
        for index in 0 ..< pattern.count {
            guard index < pureNumber.count else { return pureNumber }
            let stringIndex = String.Index(utf16Offset: index, in: self)
            let patternCharacter = pattern[stringIndex]
            guard patternCharacter != replacmentCharacter else { continue }
            pureNumber.insert(patternCharacter, at: stringIndex)
        }
        return pureNumber
    }
    
    
    
    subscript(_ i: Int) -> String {
      let idx1 = index(startIndex, offsetBy: i)
      let idx2 = index(idx1, offsetBy: 1)
      return String(self[idx1..<idx2])
    }

    subscript (r: Range<Int>) -> String {
      let start = index(startIndex, offsetBy: r.lowerBound)
      let end = index(startIndex, offsetBy: r.upperBound)
      return String(self[start ..< end])
    }

    subscript (r: CountableClosedRange<Int>) -> String {
      let startIndex =  self.index(self.startIndex, offsetBy: r.lowerBound)
      let endIndex = self.index(startIndex, offsetBy: r.upperBound - r.lowerBound)
      return String(self[startIndex...endIndex])
    }
    
    subscript(_ range: NSRange) -> String {
           let start = self.index(self.startIndex, offsetBy: range.lowerBound)
           let end = self.index(self.startIndex, offsetBy: range.upperBound)
           let subString = self[start..<end]
           return String(subString)
       }
    
    func hasSpecialCharacters() -> Bool {

        do {
            let regex = try NSRegularExpression(pattern: ".*[^A-Za-z0-9].*", options: .caseInsensitive)
            if let _ = regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions.reportCompletion, range: NSMakeRange(0, self.count)) {
                return true
            }

        } catch {
            debugPrint(error.localizedDescription)
            return false
        }

        return false
    }
}


extension Character {

        func isUpperCase() -> Bool {
            return CharacterSet.uppercaseLetters.contains(self.unicodeScalars.first!)
        }

        func isLowerCase() -> Bool {
            return CharacterSet.lowercaseLetters.contains(self.unicodeScalars.first!)
        }
    
    func isDigit() -> Bool {
        return CharacterSet.decimalDigits.contains(self.unicodeScalars.first!)
    }

    func isSpecialChar() -> Bool {
        return CharacterSet.symbols.contains(self.unicodeScalars.first!)
    }
    


  }
