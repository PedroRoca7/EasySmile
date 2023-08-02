//
//  MainMenuDentistViewController.swift
//  EasySmile
//
//  Created by Pedro Henrique on 24/07/23.
//

import UIKit

class MainMenuDentistViewController: UIViewController {
   
    private lazy var viewScreen: MainMenuDentistView = {
        let viewScreen = MainMenuDentistView()
        
        return viewScreen
    }()
    
    var dentistData: Dentist?
    
    override func loadView() {
        self.view = viewScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let dentistData = dentistData else { return }
        viewScreen.nameDentistLabel.text = ("Olá \(dentistData.nome)")
        
    }
}
