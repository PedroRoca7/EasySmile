//
//  RegisterPatient.swift
//  EasySmile
//
//  Created by Pedro Henrique on 28/07/23.
//

import Foundation

protocol RegisterPatientViewModelProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

class RegisterPatientViewModel {

    weak var delegate: RegisterPatientViewModelProtocol?
    
    public func registerPatientDb(patient: Patient) {
        
        AuthenticatorFirebase.auth.createUser(withEmail: patient.email, password: patient.senha) { (result, error) in
            
            if let error = error {
                self.delegate?.failure(error: error)
            } else if let user = result?.user {
                let userID = user.uid
                
                let userData: [String: Any] = [
                    "nome": patient.nome,
                    "email": patient.email,
                    "cpf": patient.cpf,
                    "telefone": patient.telefone,
                ]
                
                let db = AuthenticatorFirebase.firestore
                
                db.collection("Pacientes").document(userID).setData(userData) { error in
                    if let error = error {
                        self.delegate?.failure(error: error)
                    } else {
                        self.delegate?.success()
                    }
                }
            }
        }
    }
}
