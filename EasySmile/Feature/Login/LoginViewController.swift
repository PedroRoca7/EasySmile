//
//  ScreenLoginViewController.swift
//  EasySmile
//
//  Created by Pedro Henrique on 14/07/23.
//

import UIKit

class LoginViewController: UIViewController {
        
    var patient: Patient?
    var dentist: Dentist?
    
    private lazy var viewModel: LoginViewModel = {
        let viewModel = LoginViewModel()
        
        return viewModel
    }()
    
    private lazy var viewScreen: LoginView = {
        let viewScreen = LoginView()
        
        return viewScreen
    }()
    
    override func loadView() {
        self.view = viewScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationController()
        viewScreen.loginButton.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        hideKeyBoardWhenTapped()
    }
    
    private func configNavigationController() {
        title = "Login"
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.prefersLargeTitles = true
        let textAttributed = [NSAttributedString.Key.foregroundColor: UIColor.magenta]
        navigationController?.navigationBar.largeTitleTextAttributes = textAttributed
    }
    
    @objc private func loginPressed() {
    
        guard let email = viewScreen.emailTextField.text,
              let senha = viewScreen.passwordTextField.text,
              !email.isEmpty,
              !senha.isEmpty else {
            Alert.showActionSheet(title: "Erro", message: "Erro ao fazer login, email ou senha inválidos", viewController: self)
            return
        }
        
        viewModel.login(email: email, senha: senha, completion: { patient, dentist, error in
            if let error = error {
                print("Erro ao fazer login: \(error.localizedDescription)")
                Alert.showActionSheet(title: "Erro", message: "Erro ao fazer login, email ou senha inválidos", viewController: self)
            } else if let patient = patient {
                self.patient = Patient(nome: patient.nome, email: patient.email, cpf: patient.cpf, telefone: patient.telefone, senha: "")
                let mainMenuPatient = MainMenuPatientViewController()
                mainMenuPatient.patientData = self.patient
                self.navigationController?.pushViewController(mainMenuPatient, animated: true)
            } else if let dentist = dentist {
                self.dentist = Dentist(nome: dentist.nome, email: dentist.email, cpf: dentist.cpf, telefone: dentist.telefone, numeroDaInscricao: dentist.numeroDaInscricao, uf: dentist.uf, ruaDoConsultorio: dentist.ruaDoConsultorio, senha: "")
                let mainMenuDentist = MainMenuDentistViewController()
                mainMenuDentist.dentistData = self.dentist
                self.navigationController?.pushViewController(mainMenuDentist, animated: true)
            }
        })
    }
}

extension LoginViewController {
    func showErrorLogin() {
        Alert.showBasicAlert(title: "", message: "", viewController: self)
    }
}
