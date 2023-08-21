//
//  Alert.swift
//  EasySmile
//
//  Created by Pedro Henrique on 19/07/23.
//

import UIKit

class Alert {
    
    static func showBasicAlert(title: String, message: String, viewController: UIViewController) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
           
            let screenLoginViewController = LoginViewController()
            viewController.navigationController?.pushViewController(screenLoginViewController, animated: true)
        }

        alertController.addAction(okAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    static func showActionSheet(title: String, message: String, viewController: UIViewController) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        let tryAgainAction = UIAlertAction(title: "Tente outra vez", style: .default)
        alertController.addAction(tryAgainAction)
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel) { _ in
            let cancelViewController = InitialScreenViewController()
            viewController.navigationController?.pushViewController(cancelViewController, animated: true)
        }
        alertController.addAction(cancelAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
}
