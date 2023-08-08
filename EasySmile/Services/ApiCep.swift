//
//  ApiCep.swift
//  EasySmile
//
//  Created by Pedro Henrique on 25/07/23.
//

import Foundation

class ApiCep {
    
    class public func searchCep(cep: String, completion: @escaping (Cep?) -> Void) {
        guard let url = URL(string: "https://viacep.com.br/ws/\(cep)/json/") else {return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error == nil {
                guard let response = response as? HTTPURLResponse else { return }
                
                if response.statusCode == 200 {
                    guard let data = data else { return }
                    do {
                        let cep = try JSONDecoder().decode(Cep.self, from: data)
                        DispatchQueue.main.async {
                            completion(cep)
                        }
                    } catch {
                        print(error.localizedDescription)
                        DispatchQueue.main.async {
                            completion(nil)
                        }
                    }
                } else {
                    print("Status inválido do servidor, Status Code: \(response.statusCode)")
                    DispatchQueue.main.async {
                        completion(nil)
                    }
                }
            } else {
                print(error!.localizedDescription)
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        } .resume()
    }
}
