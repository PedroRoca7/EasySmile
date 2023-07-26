//
//  RegisterPatientViewController.swift
//  EasySmile
//
//  Created by Pedro Henrique on 18/07/23.
//

import UIKit

class RegisterPatientViewController: UIViewController {
    
    @IBOutlet weak var nomeCompletoPacientTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var cpfTextField: UITextField!
    @IBOutlet weak var telefoneTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    @IBOutlet weak var cadastrarButton: UIButton!
    
    var viewModel: RegisterLoginViewModel?
    var textFields: [UITextField] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFields = [nomeCompletoPacientTextField, emailTextField, cpfTextField, telefoneTextField, senhaTextField]
        addObservadoresTextField(textFileds: textFields)
        hideKeyBoardWhenTapped()
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
            cadastrarButton.isEnabled = true
            cadastrarButton.backgroundColor = .magenta
        } else {
            cadastrarButton.isEnabled = false
            cadastrarButton.backgroundColor = .darkGray
        }
    }
    
    @IBAction func registerPatient(_ sender: Any) {
        
        viewModel = RegisterLoginViewModel()
        
        guard let nome = nomeCompletoPacientTextField.text,
              let email = emailTextField.text,
              let cpf = cpfTextField.text,
              let telefone = telefoneTextField.text,
              let senha = senhaTextField.text else { return }
        
        let patient = Patient(nome: nome, email: email, cpf: cpf, telefone: telefone, senha: senha)
        
        viewModel?.registerPatientDb(patient: patient, onComplete: { result in
            if result {
                Alert.showBasicAlert(title: "Sucesso", message: "Cadastro feito com sucesso.", viewController: self)
            } else {
                Alert.showActionSheet(title: "Erro", message: "Erro ao fazer o cadastro.", viewController: self)
            }
        })
    }
}

