//
//  MainMenuViewController.swift
//  EasySmile
//
//  Created by Pedro Henrique on 20/07/23.
//

import UIKit

class MainMenuPatientViewController: UIViewController {

    @IBOutlet weak var namePatientLabel: UILabel!
    
    
    var screenMainMenuPatient: MainMenuPatientView?
    var patientData: Patient?
    
    override func loadView() {
        screenMainMenuPatient = MainMenuPatientView()
        self.view = screenMainMenuPatient
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let patientData = patientData else { return }
        namePatientLabel.text = ("Olá \(patientData.nome)")
    }

}
