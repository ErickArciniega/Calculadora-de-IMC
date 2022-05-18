//
//  GetClientes.swift
//  CalculadoraDeIMC
//
//  Created by Erick Gonzalez Arciniega on 16/05/22.
//

import SwiftUI

struct GetClientes: View {
    
    @StateObject var viewModel = ConectApi()
    
    var body: some View {
        VStack{
            Form{
                ForEach(viewModel.clientes, id: \.clienteID){ cliente in
                    Text(cliente.Nombre ?? "cliente")
                }
            }
        }.onAppear(){
            viewModel.getAllUsers()
            print("listo")
        }
    }
}


struct GetClientes_Previews: PreviewProvider {
    static var previews: some View {
        GetClientes()
    }
}
