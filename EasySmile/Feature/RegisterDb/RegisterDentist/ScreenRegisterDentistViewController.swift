//
//  RegisterDentistViewController.swift
//  EasySmile
//
//  Created by Pedro Henrique on 18/07/23.
//

import UIKit
import RxSwift
import RxCocoa

class ScreenRegisterDentistViewController: UIViewController {
    
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

        viewScreen.cepTextField.rx.controlEvent(.editingChanged)
            .subscribe(onNext: { [weak self] in
                guard let text = self?.viewScreen.cepTextField.text else { return }
                
                if text.count == 8 {
                    
                    self?.viewModel.buscarCep(cep: text, completion: { dataCep in
                        if dataCep != nil {
                            self?.viewScreen.streetOfficeTextField.text = dataCep?.logradouro
                            self?.viewScreen.streetOfficeTextField.sendActions(for: .valueChanged)
                            self?.viewScreen.ufButton.setTitle(dataCep?.uf, for: .normal)
                        }
                    })
                } else if text.count > 8 {
                    let index = text.index(text.startIndex, offsetBy: 8)
                    self?.viewScreen.cepTextField.text = String(text[..<index])
                } else {
                    self?.viewScreen.ufButton.setTitle("UF", for: .normal)
                    self?.viewScreen.streetOfficeTextField.text = ""
                    self?.viewScreen.streetOfficeTextField.sendActions(for: .valueChanged)
                }
            })
            .disposed(by: disposedBag)
        
        hideKeyBoardWhenTapped()
        viewScreen.registerButton.addTarget(self, action: #selector(registerDentist), for: .touchUpInside)
       
    }
        
    private func configNavigationController() {
        title = "Cadastro de Odontologista"
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.prefersLargeTitles = false
        let textAttributed = [NSAttributedString.Key.foregroundColor: UIColor.magenta]
        navigationController?.navigationBar.titleTextAttributes = textAttributed
    }
    
    @objc private func registerDentist() {
        
        guard let nome = viewScreen.fullNameTextField.text,
              let email = viewScreen.emailTextField.text,
              let cpf = viewScreen.cpfTextField.text,
              let telefone = viewScreen.phoneTextField.text,
              let numeroInscricaoConselho = viewScreen.numberRegistrationTextField.text,
              let ruaConsultorio = viewScreen.streetOfficeTextField.text,
              let uf = viewScreen.ufButton.title(for: .normal),
              let senha = viewScreen.passwordTextField.text else { return }
        
        let dentist = Dentist(nome: nome, email: email, cpf: cpf, telefone: telefone, numeroDaInscricao: numeroInscricaoConselho, uf: uf, ruaDoConsultorio: ruaConsultorio, senha: senha)
        
        viewModel.registerDentistDb(dentist: dentist, onComplete: { result in
            if result {
                Alert.showBasicAlert(title: "Sucesso", message: "Cadastro feito com sucesso.", viewController: self)
            } else {
                Alert.showActionSheet(title: "Erro", message: "Erro ao fazer o cadastro.", viewController: self)
            }
        })
    }
}
