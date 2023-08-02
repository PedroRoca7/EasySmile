//
//  PatientOrDentistViewController.swift
//  EasySmile
//
//  Created by Pedro Henrique on 01/08/23.
//

import UIKit

class PatientOrDentistViewController: UIViewController {
    
    private lazy var viewScreen: PatientOrDentistView = {
        let viewScreen = PatientOrDentistView()
        
        return viewScreen
    }()
    
    override func loadView() {
        self.view = viewScreen
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewScreen.patientButton.addTarget(self, action: #selector(dentistButtonPressed), for: .touchUpInside)
        viewScreen.dentistButton.addTarget(self, action: #selector(patientButtonPressed), for: .touchUpInside)
    }
    
    @objc private func dentistButtonPressed() {
        navigationController?.pushViewController(ScreenRegisterDentistViewController(), animated: true)
    }
    
    @objc private func patientButtonPressed() {
        navigationController?.pushViewController(ScreenRegisterPatientViewController(), animated: true)
    }
    
}
