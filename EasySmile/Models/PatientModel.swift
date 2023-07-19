//
//  PacientModel.swift
//  EasySmile
//
//  Created by Pedro Henrique on 19/07/23.
//

import Foundation

class Patient {
    
    var nome: String
    var email: String
    var cpf: Int
    var telefone: Int
    var senha: String
    
    init(nome: String, email: String, cpf: Int, telefone: Int, senha: String) {
        self.nome = nome
        self.email = email
        self.cpf = cpf
        self.telefone = telefone
        self.senha = senha
    }
    
}
