//
//  ViewController.swift
//  EasySmile
//
//  Created by Pedro Henrique on 14/07/23.
//

import UIKit

class InitialScreenViewController: UIViewController {
    
    private lazy var viewScreen: InitialScreenView = {
       let viewScreen = InitialScreenView()
        
        return viewScreen
    }()
    
    override func loadView() {
        self.view = viewScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewScreen.loginButton.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        viewScreen.registerButton.addTarget(self, action: #selector(registerPressed), for: .touchUpInside)
    }
    
    @objc private func loginPressed() {
        navigationController?.pushViewController(LoginViewController(), animated: true)
    }
    
    @objc private func registerPressed() {
        navigationController?.pushViewController(PatientOrDentistViewController(), animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}
