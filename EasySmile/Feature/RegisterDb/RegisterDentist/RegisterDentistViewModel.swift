//
//  RegisterDentist.swift
//  EasySmile
//
//  Created by Pedro Henrique on 28/07/23.
//

import Foundation
import Firebase
import FirebaseFirestore

class RegisterDentistViewModel {
    
    private var _ufs : [String] = ["AC", "AL", "AP", "AM", "BA", "CE", "DF", "ES", "GO", "MA", "MT", "MS", "MG", "PA", "PB", "PR", "PE", "PI", "RJ", "RN", "RS", "RO", "RR", "SC", "SP", "SE", "TO"]
    
    var ufs: [String] {
        return _ufs
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
        
    public func buscarCep(cep: String, completion: @escaping (Cep?) -> Void) {
        ApiCep.searchCep(cep: cep) {  dataCep in
            if let cep = dataCep {
                completion(cep)
            } else {
                completion(nil)
            }
        }
    }
}
