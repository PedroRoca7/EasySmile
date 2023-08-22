//
//  MainMenuDentistCoordinator.swift
//  EasySmile
//
//  Created by Pedro Henrique on 22/08/23.
//

import UIKit

class MainMenuDentistCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = MainMenuDentistViewController()
        navigationController.pushViewController(viewController, animated: true)
    }
    
    
}
