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
    var numeroDaInscricao: String
    var uf: String
    var ruaDoConsultorio: String
    var senha: String
    
    init(nome: String, email: String, cpf: String, telefone: String, numeroDaInscricao: String, uf: String, ruaDoConsultorio: String, senha: String) {
        self.nome = nome
        self.email = email
        self.cpf = cpf
        self.telefone = telefone
        self.numeroDaInscricao = numeroDaInscricao
        self.uf = uf
        self.ruaDoConsultorio = ruaDoConsultorio
        self.senha = senha
        
    }
    
}
