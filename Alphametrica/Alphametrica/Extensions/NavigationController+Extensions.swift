//
//  NavigationController+Extensions.swift
//  Alphametrica
//
//  Created by Ravi Ranjan on 14/05/21.
//

import Foundation
import UIKit

extension UINavigationController {
    
    func containsViewController(ofKind kind: AnyClass) -> Bool {
        return self.viewControllers.contains(where: { $0.isKind(of: kind) })
      }
    
      func popToViewController(ofClass: AnyClass, animated: Bool = true) {
        if let vc = viewControllers.last(where: { $0.isKind(of: ofClass) }) {
        popToViewController(vc, animated: animated)
       }
      }
    
}
