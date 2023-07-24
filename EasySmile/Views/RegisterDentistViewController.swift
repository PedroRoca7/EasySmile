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
    
    var viewModel: RegisterLoginViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
