//
//  ConectApi.swift
//  CalculadoraDeIMC
//
//  Created by Erick Gonzalez Arciniega on 16/05/22.
//

import Foundation

import Foundation
let urlString = "http://187.188.122.85:8091/NutriNET/Cliente"

class ConectApi {
    static let shared = ConectApi()
    
    func getAllUsers(completed: @escaping([clienteModelo]) -> Void){
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let res = try JSONDecoder().decode([clienteModelo].self, from: data)
                        completed(res)
                    } catch let error {
                        print(error)
                    }
                }
            }.resume()
        }
    }
}
