//
//  Alert.swift
//  EasySmile
//
//  Created by Pedro Henrique on 19/07/23.
//

import UIKit

class Alert {
    
    static func showBasicAlert(title: String, message: String, viewController: UIViewController, onCompletion: @escaping (Bool) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            onCompletion(true)
        }
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    static func showActionSheet(title: String, message: String, viewController: UIViewController, onCompletion: @escaping (Bool) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let tryAgainAction = UIAlertAction(title: "Tente outra vez", style: .default) { _ in
            alertController.dismiss(animated: true)
            onCompletion(true)
        }
        alertController.addAction(tryAgainAction)
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel) { _ in
            onCompletion(false)
        }
        alertController.addAction(cancelAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
}
