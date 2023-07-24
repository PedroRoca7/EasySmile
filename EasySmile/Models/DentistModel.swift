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
    var cpf: String
    var telefone: String
    var senha: String
    var ruaDoConsultorio: String
    var numeroDaInscricao: String
    
    init(nome: String, email: String, cpf: String, telefone: String, senha: String, ruaDoConsultorio: String, numeroDaInscricao: String) {
        self.nome = nome
        self.email = email
        self.cpf = cpf
        self.telefone = telefone
        self.senha = senha
        self.ruaDoConsultorio = ruaDoConsultorio
        self.numeroDaInscricao = numeroDaInscricao
    }
    
}
