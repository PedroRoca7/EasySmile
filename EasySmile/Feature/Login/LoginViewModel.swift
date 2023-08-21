//
//  RegisterPatientViewModel.swift
//  EasySmile
//
//  Created by Pedro Henrique on 19/07/23.
//

import Foundation

protocol LoginViewModelProtocol: AnyObject {
    func successPatient(patient: Patient)
    func successDentist(dentist: Dentist)
    func failure(error: Error)
}

class LoginViewModel {
    
    var logradouro: String?
    var uf: String?
    weak var delegate: LoginViewModelProtocol?
    
    public func login(email: String, senha: String) {
        
        AuthenticationFirebase.auth.signIn(withEmail: email, password: senha) { (result, error) in
            if let error = error {
                self.delegate?.failure(error: error)
            } else if let user = result?.user {
                self.checkUserCollection { result in
                    if result {
                        let userID = user.uid
                        
                        let db = AuthenticationFirebase.firestore
                        
                        db.collection("Pacientes").document(userID).getDocument { document, error in
                            if let document = document, document.exists {
                                if let userData = document.data() {
                                    guard let nome = userData["nome"] as? String,
                                          let email = userData["email"] as? String,
                                          let cpf = userData["cpf"] as? String,
                                          let telefone = userData["telefone"] as? String else { return }
                                    let patient = Patient(nome: nome, email: email, cpf: cpf, telefone: telefone, senha: "")
                                    self.delegate?.successPatient(patient: patient)
                                } else {
                                    print("Documento do paciente não encontrado ou ocorreu um erro: \(error?.localizedDescription ?? "Erro desconhecido")")
                                    guard let error = error else { return }
                                    self.delegate?.failure(error: error)
                                }
                            }
                        }
                    } else {
                        let userID = user.uid
                        
                        let db = AuthenticationFirebase.firestore
                        
                        db.collection("Odontologistas").document(userID).getDocument { document, error in
                            if let document = document, document.exists {
                                if let userData = document.data() {
                                    guard let nome = userData["nome"] as? String,
                                          let email = userData["email"] as? String,
                                          let cpf = userData["cpf"] as? String,
                                          let telefone = userData["telefone"] as? String,
                                          let numeroDaInscricaoConselho = userData["numeroDaInscricao"] as? String,
                                          let uf = userData["uf"] as? String,
                                          let ruaDoConsultorio = userData["ruaDoConsultorio"] as? String else { return }
                                    let dentist = Dentist(nome: nome, email: email, cpf: cpf, telefone: telefone, numeroDaInscricao: numeroDaInscricaoConselho, uf: uf, ruaDoConsultorio: ruaDoConsultorio, senha: "")
                                    self.delegate?.successDentist(dentist: dentist)
                                } else {
                                    print("Documento do paciente não encontrado ou ocorreu um erro: \(error?.localizedDescription ?? "Erro desconhecido")")
                                    guard let error = error else { return }
                                    self.delegate?.failure(error: error)
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    
    private func checkUserCollection(complete: @escaping (Bool) -> Void) {
        guard let userID = AuthenticationFirebase.auth.currentUser?.uid else {
            print("Erro: nenhum usuário logado.")
            return
        }
        
        let db = AuthenticationFirebase.firestore
        
        let pacientRef = db.collection("Pacientes").document(userID)
        pacientRef.getDocument { document, error in
            if let document = document, document.exists {
                complete(true)
            } else {
                let dentistRef = db.collection("Odontologistas").document(userID)
                dentistRef.getDocument { document, error in
                    if let document = document, document.exists {
                        complete(false)
                    } else {
                        print("Usuário não encontrado em nenhuma coleção.")
                    }
                }
            }
        }
    }
}
