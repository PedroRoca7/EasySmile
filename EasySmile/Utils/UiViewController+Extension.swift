//
//  UiViewController+Extension.swift
//  EasySmile
//
//  Created by Pedro Henrique on 26/07/23.
//

import Foundation
import UIKit

extension UIViewController {
    
    public func hideKeyBoardWhenTapped() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
