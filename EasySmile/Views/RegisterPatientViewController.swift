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
    
    var viewModel: RegisterPatientViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addObservadoresTextField()
        
    }
    
    func addObservadoresTextField() {
        nomeCompletoPacientTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        cpfTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        telefoneTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        senhaTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange() {
       
        let textFields: [UITextField] = [nomeCompletoPacientTextField, emailTextField, cpfTextField, telefoneTextField, senhaTextField]

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


    @IBAction func cadastrarPaciente(_ sender: Any) {
        
        viewModel = RegisterPatientViewModel()
        
        guard let nome = nomeCompletoPacientTextField.text,
              let email = emailTextField.text,
              let cpf = Int(cpfTextField.text ?? "0"),
              let telefone = Int(telefoneTextField.text ?? "0"),
              let senha = senhaTextField.text else { return }
        
        let patient = Patient(nome: nome, email: email, cpf: cpf, telefone: telefone, senha: senha)
            
        viewModel?.addPatient(patient: patient)
    }
}
