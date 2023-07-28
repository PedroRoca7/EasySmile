//
//  MainMenuDentistViewController.swift
//  EasySmile
//
//  Created by Pedro Henrique on 24/07/23.
//

import UIKit

class MainMenuDentistViewController: UIViewController {

    @IBOutlet weak var nameDentistLabel: UILabel!
   
    var dentistData: Dentist?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let dentistData = dentistData else { return }
        nameDentistLabel.text = ("Olá \(dentistData.nome)")
        
    }
}
