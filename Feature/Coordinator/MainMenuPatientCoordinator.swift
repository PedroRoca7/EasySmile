//
//  MainMenuPatientCoordinator.swift
//  EasySmile
//
//  Created by Pedro Henrique on 22/08/23.
//

import UIKit

class MainMenuPatientCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = MainMenuPatientViewController()
        navigationController.pushViewController(viewController, animated: true)
    }
    
}
