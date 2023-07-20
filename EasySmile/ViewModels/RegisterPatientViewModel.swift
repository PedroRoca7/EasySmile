//
//  RegisterPatientViewModel.swift
//  EasySmile
//
//  Created by Pedro Henrique on 19/07/23.
//

import Foundation
import Firebase
import FirebaseFirestore


class RegisterPatientViewModel {
    
    
    
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
