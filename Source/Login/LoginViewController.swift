//
//  ScreenLoginViewController.swift
//  EasySmile
//
//  Created by Pedro Henrique on 14/07/23.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {
    
    var failureLogin: (() -> Void)?
    var successPatient: (() -> Void)?
    var sucessDentist: (() -> Void)?
    var patient: Patient?
    var dentist: Dentist?
    private let disposedBag = DisposeBag()
    
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
        hideKeyBoardWhenTapped()
        viewModel.delegate = self
        
        viewScreen.loginButton.rx.tap.bind {
            guard let email = self.viewScreen.emailTextField.text,
                  let senha = self.viewScreen.passwordTextField.text,
                  !email.isEmpty,
                  !senha.isEmpty else {
                Alert.showActionSheet(title: "Erro", message: "Erro ao fazer login, email ou senha inválidos", viewController: self) { result in
                    if !result {
                        self.failureLogin?()
                    }
                }
                return
            }

            self.viewModel.login(email: email, senha: senha)
        }.disposed(by: disposedBag)
        
    }
    
    private func configNavigationController() {
        title = "Login"
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.prefersLargeTitles = true
        let textAttributed = [NSAttributedString.Key.foregroundColor: UIColor.magenta]
        navigationController?.navigationBar.largeTitleTextAttributes = textAttributed
    }
}

extension LoginViewController: LoginViewModelProtocol {
    func successPatient(patient: Patient) {
        self.patient = Patient(nome: patient.nome, email: patient.email, cpf: patient.cpf, telefone: patient.telefone, senha: "")
        let mainMenuPatient = MainMenuPatientViewController()
        mainMenuPatient.patientData = self.patient
        successPatient?()
    }
    
    func successDentist(dentist: Dentist) {
        self.dentist = Dentist(nome: dentist.nome, email: dentist.email, cpf: dentist.cpf, telefone: dentist.telefone, numeroDaInscricao: dentist.numeroDaInscricao, uf: dentist.uf, ruaDoConsultorio: dentist.ruaDoConsultorio, senha: "")
        let mainMenuDentist = MainMenuDentistViewController()
        mainMenuDentist.dentistData = self.dentist
        sucessDentist?()
    }
    
    func failure(error: Error) {
        print("Erro ao fazer login: \(error.localizedDescription)")
        Alert.showActionSheet(title: "Erro", message: "Erro ao fazer login, email ou senha inválidos", viewController: self) { result in
            if !result {
                self.failureLogin?()
            }
        }
    }
    
    
}
