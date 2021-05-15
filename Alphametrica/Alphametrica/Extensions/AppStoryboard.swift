//
//  AppStoryboard.swift
//  Alphametrica
//
//  Created by Ravi Ranjan on 14/05/21.
//

import Foundation
import UIKit



enum AppStoryboard : String {
    case Main
    var instance : UIStoryboard {
      return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func viewController<T: UIViewController>(viewControllerClass : T.Type) -> T {
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        return instance.instantiateViewController(withIdentifier: storyboardID) as! T
    }
    /*
     T refers to the generic argument, T.Type means Data type of T
     */
    
    func initialViewController() -> UIViewController {
        return instance.instantiateInitialViewController()!
    }
}


extension UIViewController {
   class var storyboardID : String {
     return "\(self)"
   }
    
    static func instantiateFromAppStoryboard(appStoryboard: AppStoryboard) -> Self {
        return appStoryboard.viewController(viewControllerClass: self)
    }
}

