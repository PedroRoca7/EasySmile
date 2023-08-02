//
//  RegisterPatientViewController.swift
//  EasySmile
//
//  Created by Pedro Henrique on 18/07/23.
//

import UIKit

class ScreenRegisterPatientViewController: UIViewController {
    

    private var textFields: [UITextField] = []
    
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
        textFields = [viewScreen.fullNameTextField,
                      viewScreen.emailTextField,
                      viewScreen.cpfTextField,
                      viewScreen.phoneTextField,
                      viewScreen.passwordTextField]
        
        addObservadoresTextField(textFileds: textFields)
        hideKeyBoardWhenTapped()
        viewScreen.registerButton.addTarget(self, action: #selector(registerPatient), for: .touchUpInside)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        removeObservadoresTextField(textFileds: textFields)
    }
    
    private func addObservadoresTextField(textFileds: [UITextField]) {
        for textField in textFileds {
            textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        }
    }
    
    private func removeObservadoresTextField(textFileds: [UITextField]) {
        for textFiled in textFileds {
            textFiled.removeTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        }
    }
    
    @objc func textFieldDidChange() {
        checkTextFieldIsEmpty()
    }
    
    private func checkTextFieldIsEmpty() {
        var allFieldsFilled = true
        
        for textField in textFields {
            if let text = textField.text, text.isEmpty {
                allFieldsFilled = false
                break
            }
        }
        
        if allFieldsFilled {
            viewScreen.registerButton.isEnabled = true
            viewScreen.registerButton.backgroundColor = .magenta
        } else {
            viewScreen.registerButton.isEnabled = false
            viewScreen.registerButton.backgroundColor = .darkGray
        }
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

