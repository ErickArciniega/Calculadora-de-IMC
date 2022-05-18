//
//  ConectApi.swift
//  CalculadoraDeIMC
//
//  Created by Erick Gonzalez Arciniega on 16/05/22.
//

import Foundation

final class ConectApi: ObservableObject {
    
    let urlString = "http://187.188.122.85:8091/NutriNET/Cliente"
    @Published var clientes: [clienteModelo] = []
    
    func getAllUsers(){
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if let _ = error{
                print("Error")
            }
            
            if let data = data,
                let httpResponse = response as? HTTPURLResponse,
                    httpResponse.statusCode == 200 {
                let clientModel = try! JSONDecoder().decode([clienteModelo].self, from: data)
                DispatchQueue.main.async {
                    self.clientes = clientModel
                }
            }
            
        }.resume()
    }
    
    func postUser(nombre: String, apellidos: String, userName: String, email: String, password: String){
        let url = URL(string: urlString)
        
        let body: [String: Any] = ["Nombre": nombre, "Apellidos": apellidos, "Nombre_Usuario": userName, "Correo_Electronico": email, "Contraseña": password]
        
        let finalData = try! JSONSerialization.data(withJSONObject: body)
        
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = finalData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            do{
                if let data = data {
                    let httpResponse = response as? HTTPURLResponse
                    if httpResponse?.statusCode != 200{
                        print("Error")
                    }
                }else{
                    print("ERROR")
                }
            }catch (let error){
                print("error: ", error.localizedDescription)
            }
            
        }.resume()
    }
}
