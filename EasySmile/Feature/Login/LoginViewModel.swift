//
//  RegisterPatientViewModel.swift
//  EasySmile
//
//  Created by Pedro Henrique on 19/07/23.
//

import Foundation
import Firebase
import FirebaseFirestore


class LoginViewModel {
    
    var logradouro: String?
    var uf: String?
    
    public func login(email: String, senha: String, completion: @escaping (Patient?,Dentist?, Error?) -> Void) {
        
        Auth.auth().signIn(withEmail: email, password: senha) { (result, error) in
            if let error = error {
                print("Erro ao fazer login: \(error.localizedDescription)")
                completion(nil, nil, error)
            } else if let user = result?.user {
                self.checkUserCollection { result in
                    if result {
                        let userID = user.uid
                        
                        let db = Firestore.firestore()
                        
                        db.collection("Pacientes").document(userID).getDocument { document, error in
                            if let document = document, document.exists {
                                if let userData = document.data() {
                                    guard let nome = userData["nome"] as? String,
                                          let email = userData["email"] as? String,
                                          let cpf = userData["cpf"] as? String,
                                          let telefone = userData["telefone"] as? String else { return }
                                    let patient = Patient(nome: nome, email: email, cpf: cpf, telefone: telefone, senha: "")
                                    completion(patient, nil, nil)
                                } else {
                                    print("Documento do paciente não encontrado ou ocorreu um erro: \(error?.localizedDescription ?? "Erro desconhecido")")
                                    completion(nil, nil, error)
                                }
                            }
                        }
                    } else {
                        let userID = user.uid
                        
                        let db = Firestore.firestore()
                        
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
                                    completion(nil, dentist, nil)
                                } else {
                                    print("Documento do paciente não encontrado ou ocorreu um erro: \(error?.localizedDescription ?? "Erro desconhecido")")
                                    completion(nil, nil, error)
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    
    private func checkUserCollection(complete: @escaping (Bool) -> Void) {
        guard let userID = Auth.auth().currentUser?.uid else {
            print("Erro: nenhum usuário logado.")
            return
        }
        
        let db = Firestore.firestore()
        
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
