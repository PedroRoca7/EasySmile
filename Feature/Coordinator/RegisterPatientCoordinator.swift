//
//  RegisterPatientCoordinator.swift
//  EasySmile
//
//  Created by Pedro Henrique on 22/08/23.
//

import UIKit

class RegisterPatientCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = RegisterPatientViewController()
        
        viewController.successRegister = {
            self.showLogin()
        }
        
        viewController.failureRegister = {
            self.showInitialScreen()
        }
        
        navigationController.pushViewController(viewController, animated: true)
        
    }
    
    private func showLogin() {
        let coordinator = LoginCoordinator(navigationController: navigationController)
        coordinator.start()
    }
    
    private func showInitialScreen() {
        let coordinator = ScreenInitialCoordinator(navigationController: navigationController)
        coordinator.start()
    }
}
