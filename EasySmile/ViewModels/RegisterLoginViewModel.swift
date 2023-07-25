//
//  RegisterPatientViewModel.swift
//  EasySmile
//
//  Created by Pedro Henrique on 19/07/23.
//

import Foundation
import Firebase
import FirebaseFirestore


class RegisterLoginViewModel {
    
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
    
    public func registerPatientDb(patient: Patient, onComplete: @escaping (Bool) -> Void) {
        
        Auth.auth().createUser(withEmail: patient.email, password: patient.senha) { (result, error) in
            
            if let error = error {
                print("Erro ao cadastrar conta: \(error.localizedDescription)")
            } else if let user = result?.user {
                let userID = user.uid
                
                let userData: [String: Any] = [
                    "nome": patient.nome,
                    "email": patient.email,
                    "cpf": patient.cpf,
                    "telefone": patient.telefone,
                ]
                
                let db = Firestore.firestore()
                
                db.collection("Pacientes").document(userID).setData(userData) { error in
                    if let error = error {
                        print("Erro ao cadastrar Paciente: \(error.localizedDescription)")
                        onComplete(false)
                    } else {
                        onComplete(true)
                    }
                }
            }
        }
    }
    
    public func registerDentistDb(dentist: Dentist, onComplete: @escaping (Bool) -> Void) {
        
        Auth.auth().createUser(withEmail: dentist.email, password: dentist.senha) { (result, error) in
            
            if let error = error {
                print("Erro ao cadastrar conta: \(error.localizedDescription)")
            } else if let user = result?.user {
                let userID = user.uid
                
                let userData: [String: Any] = [
                    "nome": dentist.nome,
                    "email": dentist.email,
                    "cpf": dentist.cpf,
                    "telefone": dentist.telefone,
                    "numeroDaInscricao": dentist.numeroDaInscricao,
                    "uf": dentist.uf,
                    "ruaDoConsultorio": dentist.ruaDoConsultorio
                ]
                
                let db = Firestore.firestore()
                
                db.collection("Odontologistas").document(userID).setData(userData) { error in
                    if let error = error {
                        print("Erro ao cadastrar Odontologista: \(error.localizedDescription)")
                        onComplete(false)
                    } else {
                        onComplete(true)
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
