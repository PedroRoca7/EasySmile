//
//  RegisterPatientViewController.swift
//  EasySmile
//
//  Created by Pedro Henrique on 18/07/23.
//

import UIKit
import RxSwift
import RxCocoa

class ScreenRegisterPatientViewController: UIViewController {
    
    private var textFields: [UITextField] = []
    private let disposedBag = DisposeBag()
    
    private lazy var viewModel: RegisterPatientViewModel = {
        let viewModel = RegisterPatientViewModel()
        
        return viewModel
    }()
    
    private lazy var viewScreen: RegisterPatientView = {
        let viewScreen = RegisterPatientView()
        
        return viewScreen
    }()

    
    override func loadView() {
        self.view = viewScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationController()
        textFields = [viewScreen.fullNameTextField,
                      viewScreen.emailTextField,
                      viewScreen.cpfTextField,
                      viewScreen.phoneTextField,
                      viewScreen.passwordTextField]
        
        let textFieldsObservables = textFields.map { $0.rx.text.orEmpty.asObservable() }

        let combinedFieldsObservables = Observable.combineLatest(textFieldsObservables) { texts in
            return texts.allSatisfy { !$0.isEmpty }
        }

        combinedFieldsObservables
            .subscribe(onNext: { [weak self] allFilled in
                self?.viewScreen.registerButton.isEnabled = allFilled
                self?.viewScreen.registerButton.backgroundColor = allFilled ? .magenta : .darkGray
            })
            .disposed(by: disposedBag)
        
        hideKeyBoardWhenTapped()
        viewScreen.registerButton.addTarget(self, action: #selector(registerPatient), for: .touchUpInside)
    }
        
    private func configNavigationController() {
        title = "Cadastro de Paciente"
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.prefersLargeTitles = false
        let textAttributed = [NSAttributedString.Key.foregroundColor: UIColor.magenta]
        navigationController?.navigationBar.titleTextAttributes = textAttributed
    }
    
    @objc private func registerPatient() {
        
        guard let nome = viewScreen.fullNameTextField.text,
              let email = viewScreen.emailTextField.text,
              let cpf = viewScreen.cpfTextField.text,
              let telefone = viewScreen.phoneTextField.text,
              let senha = viewScreen.passwordTextField.text else { return }
        
        let patient = Patient(nome: nome, email: email, cpf: cpf, telefone: telefone, senha: senha)
        
        viewModel.registerPatientDb(patient: patient, onComplete: { result in
            if result {
                Alert.showBasicAlert(title: "Sucesso", message: "Cadastro feito com sucesso.", viewController: self)
            } else {
                Alert.showActionSheet(title: "Erro", message: "Erro ao fazer o cadastro.", viewController: self)
            }
        })
    }
}

