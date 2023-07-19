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
    
    let db = Firestore.firestore()
    
    func addPatient(patient: Patient) {
        
        let usuarioData: [String: Any] = [
            "nome": patient.nome,
            "email": patient.email,
            "cpf": patient.cpf,
            "telefone": patient.telefone,
            "senha": patient.senha
        ]
        
        db.collection("Pacientes").addDocument(data: usuarioData) { error in
            if let error = error {
                print("Erro ao cadastrar Paciente \(error.localizedDescription)")
            } else {
                print("Paciente cadastrado com sucesso")
            }
        }
    }
    
}
