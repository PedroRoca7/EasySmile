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
    var dentist: Dentist?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyBoardWhenTapped()
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
        
        viewModel?.login(email: email, senha: senha, completion: { patient, dentist, error in
            if let error = error {
                print("Erro ao fazer login: \(error.localizedDescription)")
                Alert.showActionSheet(title: "Erro", message: "Erro ao fazer login, email ou senha inválidos", viewController: self)
            } else if let patient = patient {
                self.patient = Patient(nome: patient.nome, email: patient.email, cpf: patient.cpf, telefone: patient.telefone, senha: "")
                self.performSegue(withIdentifier: "MainMenuPatientSegue", sender: self.patient)
            } else if let dentist = dentist {
                self.dentist = Dentist(nome: dentist.nome, email: dentist.email, cpf: dentist.cpf, telefone: dentist.telefone, numeroDaInscricao: dentist.numeroDaInscricao, uf: dentist.uf, ruaDoConsultorio: dentist.ruaDoConsultorio, senha: "")
                self.performSegue(withIdentifier: "MainMenuDentistSegue", sender: self.dentist)
            }
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MainMenuPatientSegue" {
            if let mainMenuViewController = segue.destination as? MainMenuPatientViewController {
                mainMenuViewController.patientData = self.patient
            }
        } else if segue.identifier == "MainMenuDentistSegue" {
                if let mainMenuViewController = segue.destination as? MainMenuDentistViewController {
                    mainMenuViewController.dentistData = self.dentist
                }
        }
    }
    
    @IBAction func forgotPassword(_ sender: Any) {
    }
    
    @IBAction func needHelp(_ sender: Any) {
    }
    
}
