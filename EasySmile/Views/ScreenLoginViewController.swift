//
//  ScreenLoginViewController.swift
//  EasySmile
//
//  Created by Pedro Henrique on 14/07/23.
//

import UIKit

class ScreenLoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    
    var viewModel: RegisterLoginViewModel?
    var patient: Patient?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        viewModel = RegisterLoginViewModel()
        
        guard let email = emailTextField.text,
              let senha = senhaTextField.text,
              !email.isEmpty,
              !senha.isEmpty else {
            Alert.showActionSheet(title: "Erro", message: "Erro ao fazer login, email ou senha inválidos", viewController: self)
            return
        }
        
        viewModel?.login(email: email, senha: senha, completion: { patientData, error in
            if let error = error {
                print("Erro ao fazer login: \(error.localizedDescription)")
                Alert.showActionSheet(title: "Erro", message: "Erro ao fazer login, email ou senha inválidos", viewController: self)
            }
            if let patientData = patientData {
                self.patient?.nome = patientData.nome
                self.patient?.email = patientData.email
                self.patient?.cpf = patientData.cpf
                self.patient?.telefone = patientData.telefone
                self.performSegue(withIdentifier: "MainMenuSegue", sender: self.patient)
            }
            
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MainMenuSegue" {
            if let mainMenuViewController = segue.destination as? MainMenuViewController {
                mainMenuViewController.patientData = self.patient
            }
        }
    }
    
    @IBAction func forgotPassword(_ sender: Any) {
    }
    
    @IBAction func needHelp(_ sender: Any) {
    }
    
}
