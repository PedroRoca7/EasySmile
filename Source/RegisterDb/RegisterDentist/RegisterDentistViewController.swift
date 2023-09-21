//
//  RegisterDentistViewController.swift
//  EasySmile
//
//  Created by Pedro Henrique on 18/07/23.
//

import UIKit
import RxSwift
import RxCocoa

class RegisterDentistViewController: UIViewController {
    
    var successRegisterDentist: (() -> Void)?
    var failureRegisterDentist: (() -> Void)?
    var failureCep: (() -> Void)?
    private var cep: Cep?
    private var textFields: [UITextField] = []
    private var disposedBag = DisposeBag()

    private lazy var viewModel: RegisterDentistViewModel = {
        let viewModel = RegisterDentistViewModel()
        
        return viewModel
    }()
    
    private lazy var viewScreen: RegisterDentistView = {
        let viewScreen = RegisterDentistView()
        
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
                      viewScreen.passwordTextField,
                      viewScreen.numberRegistrationTextField,
                      viewScreen.streetOfficeTextField]
                
        let textFieldsObservables = textFields.map { $0.rx.value.orEmpty.asObservable() }
        let combinedObservables = Observable.combineLatest(textFieldsObservables) { texts in
            return texts.allSatisfy { !$0.isEmpty }
        }
        combinedObservables
            .subscribe(onNext: { [weak self]  allFields in
                self?.viewScreen.registerButton.isEnabled = allFields
                self?.viewScreen.registerButton.backgroundColor = allFields ? .magenta : .darkGray
            })
            .disposed(by: disposedBag)
        
        let textFieldCep = viewScreen.cepTextField.rx.text.orEmpty.asObservable()
        textFieldCep.subscribe { [weak self] text in
            if text.count == 8 {
                self?.viewModel.buscarCep(cep: text)
            } else if text.count > 8 {
                let index = text.index(text.startIndex, offsetBy: 8)
                self?.viewScreen.cepTextField.text = String(text[..<index])
            } else {
                self?.viewScreen.ufButton.setTitle("UF", for: .normal)
                self?.viewScreen.streetOfficeTextField.text = ""
                self?.viewScreen.streetOfficeTextField.sendActions(for: .valueChanged)
            }
        }.disposed(by: disposedBag)
        
        viewScreen.registerButton.rx.tap.bind {
            guard let nome = self.viewScreen.fullNameTextField.text,
                  let email = self.viewScreen.emailTextField.text,
                  let cpf = self.viewScreen.cpfTextField.text,
                  let telefone = self.viewScreen.phoneTextField.text,
                  let numeroInscricaoConselho = self.viewScreen.numberRegistrationTextField.text,
                  let ruaConsultorio = self.viewScreen.streetOfficeTextField.text,
                  let uf = self.viewScreen.ufButton.title(for: .normal),
                  let senha = self.viewScreen.passwordTextField.text else { return }
            
            let dentist = Dentist(nome: nome, email: email, cpf: cpf, telefone: telefone, numeroDaInscricao: numeroInscricaoConselho, uf: uf, ruaDoConsultorio: ruaConsultorio, senha: senha)
            
            self.viewModel.registerDentistDb(dentist: dentist)
            
        }.disposed(by: disposedBag)
    }
        
    private func configNavigationController() {
        title = "Cadastro de Odontologista"
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.prefersLargeTitles = false
        let textAttributed = [NSAttributedString.Key.foregroundColor: UIColor.magenta]
        navigationController?.navigationBar.titleTextAttributes = textAttributed
    }

}

extension RegisterDentistViewController: RegisterDentistViewModelProtocol {
    func successCep(dataCep: Cep) {
        self.viewScreen.streetOfficeTextField.text = dataCep.logradouro
        self.viewScreen.streetOfficeTextField.sendActions(for: .valueChanged)
        self.viewScreen.ufButton.setTitle(dataCep.uf, for: .normal)
    }
    
    func failureCep(error: Error) {
        Alert.showBasicAlert(title: "Error", message: "\(error.localizedDescription)", viewController: self) { result in
            if !result {
                self.failureCep?()
            }
        }
    }
    
    func successRegister() {
        Alert.showBasicAlert(title: "Sucesso", message: "Cadastro feito com sucesso.", viewController: self) { result in
            if !result {
                self.successRegisterDentist?()
            }
        }
    }
    
    func failureRegister(error: Error) {
        Alert.showActionSheet(title: "Erro", message: "Erro ao fazer o cadastro.", viewController: self) { result in
            if !result {
                self.failureRegisterDentist?()
            }
        }
    }
    
    
}
