//
//  ContentView.swift
//  CalculadoraDeIMC
//
//  Created by Erick Arciniega on 15/05/22.
//

import SwiftUI

struct ContentView: View {
    let CalculadoraVista = CalculadoraView()
    var body: some View {
        NavigationView{
            List {
                NavigationLink("Calcular IMC", destination:CalculadoraVista)
                Text("Usuarios de NutriNET")
            }
            .navigationTitle("Calculadora de IMC")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
