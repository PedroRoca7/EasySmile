//
//  RegisterDentist.swift
//  EasySmile
//
//  Created by Pedro Henrique on 28/07/23.
//

import Foundation
import Firebase
import FirebaseFirestore

protocol RegisterDentistViewModelProtocol: AnyObject {
    func successCep(dataCep: Cep)
    func failureCep(error: Error)
    func successRegister()
    func failureRegister(error: Error)
    
}

class RegisterDentistViewModel {
    
    weak var  delegate: RegisterDentistViewModelProtocol?
    
    public func registerDentistDb(dentist: Dentist) {
        
        Auth.auth().createUser(withEmail: dentist.email, password: dentist.senha) { (result, error) in
            
            if let error = error {
                self.delegate?.failureRegister(error: error)
                
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
                        self.delegate?.failureRegister(error: error)
                    } else {
                        self.delegate?.successRegister()
                    }
                }
            }
        }
    }
        
    public func buscarCep(cep: String) {
        ApiCep.searchCep(cep: cep) {  dataCep , error in
            if error == nil {
                guard let cep = dataCep else { return }
                self.delegate?.successCep(dataCep: cep)
            } else {
                guard let error = error else { return }
                self.delegate?.failureCep(error: error)
            }
        }
    }
}
