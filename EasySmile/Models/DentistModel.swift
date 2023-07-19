//
//  DentistModel.swift
//  EasySmile
//
//  Created by Pedro Henrique on 19/07/23.
//

import Foundation

class Dentist {
    
    var nome: String
    var email: String
    var cpf: Int
    var telefone: Int
    var senha: String
    var ruaDoConsultorio: String
    var numeroDaInscricao: Int
    
    init(nome: String, email: String, cpf: Int, telefone: Int, senha: String, ruaDoConsultorio: String, numeroDaInscricao: Int) {
        self.nome = nome
        self.email = email
        self.cpf = cpf
        self.telefone = telefone
        self.senha = senha
        self.ruaDoConsultorio = ruaDoConsultorio
        self.numeroDaInscricao = numeroDaInscricao
    }
    
}
