//
//  ScreenInitialCoordinator.swift
//  EasySmile
//
//  Created by Pedro Henrique on 22/08/23.
//

import UIKit

class ScreenInitialCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = InitialScreenViewController()
        
        viewController.loginButtonTap = {
            self.showLogin()
        }
        
        viewController.registerButtonTap = {
            self.showPatientOrDentist()
        }
        self.navigationController.pushViewController(viewController, animated: true)
    }
        
    private func showLogin() {
        let coordinator = LoginCoordinator(navigationController: self.navigationController)
        coordinator.start()
    }
    
    private func showPatientOrDentist() {
        let coordinator = PatientOrDentistCoordinator(navigationController: self.navigationController)
        coordinator.start()
    }
}
