//
//  LoginCoordinator.swift
//  EasySmile
//
//  Created by Pedro Henrique on 22/08/23.
//

import UIKit

class LoginCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = LoginViewController()
        
        viewController.successPatient = {
            self.showMainMenuPatient()
        }
        
        viewController.sucessDentist = {
            self.showMainMenuDentist()
        }
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func showMainMenuPatient() {
        let coordinator = MainMenuPatientCoordinator(navigationController: navigationController)
        coordinator.start()
        
    }
    
    private func showMainMenuDentist() {
        let coordinator = MainMenuDentistCoordinator(navigationController: navigationController)
        coordinator.start()
    }
}
 
