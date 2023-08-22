//
//  MainMenuViewController.swift
//  EasySmile
//
//  Created by Pedro Henrique on 20/07/23.
//

import UIKit

class MainMenuPatientViewController: UIViewController {

    private lazy var viewScreen: MainMenuPatientView = {
        let viewScreen = MainMenuPatientView()
        
        return viewScreen
    }()
    
    var patientData: Patient?
    
    override func loadView() {
        self.view = viewScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let patientData = patientData else { return }
        viewScreen.namePatientLabel.text = ("Olá \(patientData.nome)")
    }

}
