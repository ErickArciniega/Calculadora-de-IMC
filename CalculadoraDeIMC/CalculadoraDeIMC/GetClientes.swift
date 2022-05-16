//
//  GetClientes.swift
//  CalculadoraDeIMC
//
//  Created by Erick Gonzalez Arciniega on 16/05/22.
//

import SwiftUI

struct GetClientes: View {
    @State var models: [clienteModelo] = []
    var body: some View {
        VStack{
            List (models, id: \.clienteID) { (model) in
                HStack{
                    Text(model.Nombre ?? "")
                    Text(model.Apellidos ?? "")
                }
            }
        }.onAppear(){
            getUsersData()
        }
    }
    private func getUsersData(){
            ConectApi.shared.getAllUsers { (response) in
                self.models = response
            }
        }
}


struct GetClientes_Previews: PreviewProvider {
    static var previews: some View {
        GetClientes()
    }
}
