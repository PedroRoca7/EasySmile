//
//  MainMenuViewController.swift
//  EasySmile
//
//  Created by Pedro Henrique on 20/07/23.
//

import UIKit

class MainMenuViewController: UIViewController {

    @IBOutlet weak var namePatientLabel: UILabel!
    
    var patientData: Patient?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let patientData = patientData else { return }
        namePatientLabel.text = ("Olá \(patientData.nome)")
    }

}
