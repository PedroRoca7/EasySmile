//
//  RegisterDentistViewController.swift
//  EasySmile
//
//  Created by Pedro Henrique on 18/07/23.
//

import UIKit

class RegisterDentistViewController: UIViewController {

    @IBOutlet weak var nomeCompletoDentistTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var cpfTextField: UITextField!
    @IBOutlet weak var telefoneTextField: UITextField!
    @IBOutlet weak var numeroDaInscricaoConselhoTextField: UITextField!
    @IBOutlet weak var ruaDoConsultorioTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    @IBOutlet weak var cadastrarButton: UIButton!
    
    var viewModel: RegisterLoginViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        addObservadoresTextField()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        removeObservadoresTextField()
    }
    
    func addObservadoresTextField() {
        nomeCompletoDentistTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        cpfTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        telefoneTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        senhaTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        numeroDaInscricaoConselhoTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        ruaDoConsultorioTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    func removeObservadoresTextField() {
        nomeCompletoDentistTextField.removeTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        emailTextField.removeTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        cpfTextField.removeTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        telefoneTextField.removeTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        senhaTextField.removeTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        numeroDaInscricaoConselhoTextField.removeTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        ruaDoConsultorioTextField.removeTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange() {
        
        let textFields: [UITextField] = [nomeCompletoDentistTextField, emailTextField, cpfTextField, telefoneTextField, senhaTextField, numeroDaInscricaoConselhoTextField, ruaDoConsultorioTextField]
        
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
    
    @IBAction func cadastrarDentista(_ sender: Any) {
            
        viewModel = RegisterLoginViewModel()
        
        guard let nome = nomeCompletoDentistTextField.text,
              let email = emailTextField.text,
              let cpf = cpfTextField.text,
              let telefone = telefoneTextField.text,
              let numeroInscricaoConselho = numeroDaInscricaoConselhoTextField.text,
              let ruaConsultorio = ruaDoConsultorioTextField.text,
              let senha = senhaTextField.text else { return }
        
        let dentist = Dentist(nome: nome, email: email, cpf: cpf, telefone: telefone, senha: senha, ruaDoConsultorio: ruaConsultorio, numeroDaInscricao: numeroInscricaoConselho)

        viewModel?.registerDentistDb(dentist: dentist, onComplete: { result in
            if result {
                Alert.showBasicAlert(title: "Sucesso", message: "Cadastro feito com sucesso.", viewController: self)
            } else {
                Alert.showActionSheet(title: "Erro", message: "Erro ao fazer o cadastro.", viewController: self)
            }
        })
        
    }
    
}
