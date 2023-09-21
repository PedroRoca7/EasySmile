//
//  RegisterPatientViewController.swift
//  EasySmile
//
//  Created by Pedro Henrique on 18/07/23.
//

import UIKit
import RxSwift
import RxCocoa

class RegisterPatientViewController: UIViewController {
    
    var successRegister: (() -> Void)?
    var failureRegister: (() -> Void)?
    
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
        hideKeyBoardWhenTapped()
        viewModel.delegate = self
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
        
        viewScreen.registerButton.rx.tap.bind {
            guard let nome = self.viewScreen.fullNameTextField.text,
                  let email = self.viewScreen.emailTextField.text,
                  let cpf = self.viewScreen.cpfTextField.text,
                  let telefone = self.viewScreen.phoneTextField.text,
                  let senha = self.viewScreen.passwordTextField.text else { return }
            
            let patient = Patient(nome: nome, email: email, cpf: cpf, telefone: telefone, senha: senha)
            
            self.viewModel.registerPatientDb(patient: patient)
            
        }.disposed(by: disposedBag)
    }
        
    private func configNavigationController() {
        title = "Cadastro de Paciente"
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.prefersLargeTitles = false
        let textAttributed = [NSAttributedString.Key.foregroundColor: UIColor.magenta]
        navigationController?.navigationBar.titleTextAttributes = textAttributed
    }
}

extension RegisterPatientViewController: RegisterPatientViewModelProtocol {
    func success() {
        Alert.showBasicAlert(title: "Sucesso", message: "Cadastro feito com sucesso.",viewController: self, onCompletion: { result in
            if result {
                self.successRegister?()
            }
        })
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
        Alert.showActionSheet(title: "Erro", message: "Erro ao fazer o cadastro.", viewController: self, onCompletion: { result in
            if !result {
                self.failureRegister?()
            }
        })
    }
}
