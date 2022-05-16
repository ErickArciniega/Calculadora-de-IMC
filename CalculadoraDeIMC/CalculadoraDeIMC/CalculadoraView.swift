//
//  CalculadoraView.swift
//  CalculadoraDeIMC
//
//  Created by Erick Arciniega on 15/05/22.
//

import SwiftUI

struct CalculadoraView: View {
    @State var peso: Double = 0
    @State var altura: Int = 0
    @State var nombre: String = ""
    @State var sexo: Bool = true
    @State var edad: String = ""
    @State var selectedGender = 0
    let genders = ["Hombre", "Mujer"]
    @State var birthday: Date = Date()
    
    var body: some View {
        VStack{
            Text("Calcula tu IMC")
                .font(.largeTitle)
                .padding(.top, 10)
            Form{
                Section{
                    TextField("Ingresa tu nombre", text: $nombre)
                        .disableAutocorrection(true)
                        .padding(8)
                        .font(.headline)

                }
                Section{
                    HStack {
                        Text("Genero")
                        Picker("", selection: $selectedGender) {

                            ForEach(0..<genders.count) { index in
                                Text(self.genders[index]).tag(index).font(.title)
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                }
                Section{
                    DatePicker("Cumpleaños", selection: $birthday, displayedComponents: .date)
                }
                Section(header: Text("Introduce tu peso")) {
                    TextField("Ingresa tu peso", value: $peso, format: .number)
                        .keyboardType(.decimalPad)
                        .disableAutocorrection(true)
                        .padding(8)
                        .font(.headline)
                        .cornerRadius(6)
                }
                Section(header: Text("Introduce tu altura")){
                    TextField("Ingresa tu altura", value: $altura, format: .number)
                        .keyboardType(.decimalPad)
                        .disableAutocorrection(true)
                        .padding(8)
                        .font(.headline)
                        .cornerRadius(6)
                }
                Section{
                    Button {
                        print("nombre: \(nombre)")
                    } label: {
                        Text("Enviar")
                    }
                }
               
            }
            Spacer()

        }
    }
}

struct CalculadoraView_Previews: PreviewProvider {
    static var previews: some View {
        CalculadoraView()
    }
}
