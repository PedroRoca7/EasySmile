//
//  PatientOrDentistCoordinator.swift
//  EasySmile
//
//  Created by Pedro Henrique on 22/08/23.
//

import UIKit

class PatientOrDentistCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = PatientOrDentistViewController()
       
        viewController.registerPatientButton = {
            self.showRegisterPatient()
        }
        
        viewController.registerDentistButton = {
            self.showRegisterDentist()
        }
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func showRegisterPatient() {
        let coordinator = RegisterPatientCoordinator(navigationController: navigationController)
        coordinator.start()
    }
    
    private func showRegisterDentist() {
        let coordinator = RegisterDentistCoordinator(navigationController: navigationController)
        coordinator.start()
    }
}
