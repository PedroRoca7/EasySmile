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
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        viewScreen.patientButton.addTarget(self, action: #selector(patientButtonPressed(sender:)), for: .touchUpInside)
        viewScreen.dentistButton.addTarget(self, action: #selector(dentistButtonPressed(sender:)), for: .touchUpInside)
    }
    
    @objc private func dentistButtonPressed(sender: UIButton) {
        let screenRegisterDentistViewController = ScreenRegisterDentistViewController()
        navigationController?.pushViewController(screenRegisterDentistViewController, animated: true)
    }
    
    @objc private func patientButtonPressed(sender: UIButton) {
        let screenRegisterPatientViewController = ScreenRegisterPatientViewController()
        navigationController?.pushViewController(screenRegisterPatientViewController, animated: true)
    }
    
}
