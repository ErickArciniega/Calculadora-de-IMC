//
//  CalculadoraView.swift
//  CalculadoraDeIMC
//
//  Created by Erick Arciniega on 15/05/22.
//

import SwiftUI

struct CalculadoraView: View {
    @State var peso: Double = 1
    @State var altura: Double = 1
    @State var nombre: String = ""
    @State var sexo: Bool = true
    @State var edad: String = ""
    @State var selectedGender = 0
    let genders = ["Hombre", "Mujer"]
    @State private var birthDate = Date()
    @State private var age: DateComponents = DateComponents()
    
    @State private var showingSheet = false
    
    var calcControlador = CalculadoraController()
    
    var body: some View {
        VStack{
            Text("Calcula tu IMC")
                .font(.largeTitle)
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
                    DatePicker("Cumpleaños:", selection: $birthDate, in: ...Date(), displayedComponents: .date)
                }.onChange(of: birthDate, perform: { value in
                    age = Calendar.current.dateComponents([.year, .month, .day], from: birthDate, to: Date())
            })
                Section(header: Text("Introduce tu peso en Kg")) {
                    TextField("Ingresa tu peso", value: $peso, format: .number)
                        .keyboardType(.decimalPad)
                        .disableAutocorrection(true)
                        .padding(8)
                        .font(.headline)
                        .cornerRadius(6)
                }
                Section(header: Text("Introduce tu altura en cm")){
                    TextField("Ingresa tu altura", value: $altura, format: .number)
                        .keyboardType(.decimalPad)
                        .disableAutocorrection(true)
                        .padding(8)
                        .font(.headline)
                        .cornerRadius(6)
                }
                Section{
                    let mayorEdad = calcControlador.esMayorDeEdad(edad: age.year ?? 0)
                    let nSS = calcControlador.generaNSS()
                    let IMC = calcControlador.calcularIMC(sexo: (selectedGender != 0), peso: peso, altura: altura)
                    Button {
                        showingSheet.toggle()
                        
                    } label: {
                        Text("Enviar")
                    }
                    .sheet(isPresented: $showingSheet) {
                        userView(name: nombre, ageYears: age.year ?? 0, mayorDeEdad: mayorEdad , sexo: self.genders[selectedGender], NSS: nSS, peso: String(peso), altura: String(altura), imc: IMC.imc, imcStatus: IMC.imcText)
                    }
                }
               
            }
            Spacer()

        }
    }
}

struct userView: View{
    
    let name: String
    let ageYears: Int
    let mayorDeEdad: String
    let sexo: String
    let NSS: String
    let peso: String
    let altura: String
    let imc: Double
    let imcStatus: String
    
    var body: some View{
        VStack{
            Text(name)
                .font(.largeTitle)
                .padding(.bottom, 10)
            Text(sexo)
            Text("\(String(ageYears)) años")
            Text(mayorDeEdad)
            Text(NSS)
            HStack{
                Text("Peso: \(peso)kg")
                Text("Altura: \(altura)cm")
            }
            
            Text("IMC: \(String(imc))")
            Text(imcStatus)
        }
        
    }
}

struct CalculadoraView_Previews: PreviewProvider {
    static var previews: some View {
        CalculadoraView()
        userView(name: "Erick", ageYears: 5, mayorDeEdad: "Es mayor de edad", sexo: "otro", NSS: "nohay", peso: "55", altura: "170", imc: 22, imcStatus: "Peso ideal")
    }
}
