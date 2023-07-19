//
//  RegisterPatientViewController.swift
//  EasySmile
//
//  Created by Pedro Henrique on 18/07/23.
//

import UIKit
import Firebase
import FirebaseFirestore



class RegisterPatientViewController: UIViewController {

    @IBOutlet weak var nomeCompletoPacientTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var cpfTextField: UITextField!
    @IBOutlet weak var telefoneTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    @IBOutlet weak var cadastrarButton: UIButton!
    
    let db = Firestore.firestore()
    
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
        // Verificar se todos os campos estão preenchidos para habilitar/desabilitar o botão de envio
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

    @IBAction func submitButtonTapped(_ sender: UIButton) {
        // Realizar a ação do botão de envio aqui
        print("Botão de envio pressionado!")
    }

    @IBAction func cadastrarPaciente(_ sender: Any) {
        
        guard let nome = nomeCompletoPacientTextField.text,
              let email = emailTextField.text,
              let cpf = cpfTextField.text,
              let telefone = telefoneTextField.text,
              let senha = senhaTextField.text else { return }
        
        let usuarioData: [String: Any] = [
            "nome": nome,
            "email": email,
            "cpf": cpf,
            "telefone": telefone,
            "senha": senha
        ]
        
        db.collection("Usuarios").addDocument(data: usuarioData) { error in
            if let error = error {
                print("Erro ao cadastrar Usuário \(error.localizedDescription)")
            } else {
                print("Usuário cadastrado com sucesso")
            }
        }
        
    }
    
    
}
