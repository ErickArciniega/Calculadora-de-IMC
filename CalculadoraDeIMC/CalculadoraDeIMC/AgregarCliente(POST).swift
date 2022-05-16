//
//  Agregar Cliente (POST).swift
//  CalculadoraDeIMC
//
//  Created by Erick Gonzalez Arciniega on 16/05/22.
//

import SwiftUI

struct AgregarClientePOST: View {
    
    @State var nombre: String = ""
    @State var apellidos: String = ""
    @State var userName: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            Form{
                TextField("Nombre", text: $nombre)
                TextField("Apellidos", text: $apellidos)
                TextField("Nombre de usuario", text: $userName)
                TextField("Email", text: $email)
                TextField("Contraseña", text: $password)
                
                Section{
                    Button{
                        print("Hola")
                    }label: {
                        Text("Enviar")
                    }
                }
            }
            
        }
       
    }
}

struct Agregar_Cliente__POST__Previews: PreviewProvider {
    static var previews: some View {
        AgregarClientePOST()
    }
}
