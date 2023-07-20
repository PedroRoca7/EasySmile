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
    
    func login(email: String, senha: String, completion: @escaping (Patient?, Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: senha) { (result, error) in
            if let error = error {
                print("Erro ao fazer login: \(error.localizedDescription)")
            } else if let user = result?.user {
                let userID = user.uid
                
                let db = Firestore.firestore()
                
                db.collection("Pacientes").document(userID).getDocument { document, error in
                    if let document = document, document.exists {
                        if let userData = document.data() {
                            guard let nome = userData["nome"] as? String,
                                  let email = userData["email"] as? String,
                                  let cpf = userData["cpf"] as? String,
                                  let telefone = userData["nome"] as? String else { return }
                            let patient = Patient(nome: nome, email: email, cpf: cpf, telefone: telefone, senha: "")
                            completion(patient, nil)
                        } else {
                            print("Documento do paciente não encontrado ou ocorreu um erro: \(error?.localizedDescription ?? "Erro desconhecido")")
                            completion(nil, error)
                        }
                    }
                }
            }
        }
    }
    
    func registerPatientDb(patient: Patient, onComplete: @escaping (Bool) -> Void) {
        
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
    
}
