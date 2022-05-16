//
//  CalculadoraController.swift
//  CalculadoraDeIMC
//
//  Created by Erick Gonzalez Arciniega on 16/05/22.
//

import Foundation

struct CalculadoraController{
    
    
    func calcularIMC(sexo: Bool, peso: Double, altura: Double) -> (imc: Double, imcText: String){
        let alturam = altura/100
        let iMC = peso/(alturam * alturam)
        var imcText: String =  ""
        
        if sexo{
            switch iMC{
            case _ where iMC < 19:
                imcText = ("Falta de peso")
            case _ where iMC <= 24:
                imcText = ("Peso normal")
            case _ where iMC > 24:
                imcText = ("Sobre peso")
            default:
                print("Revisa los datos")
            }
        }else{
            switch iMC{
            case _ where iMC < 20:
                imcText = ("Falta de peso")
            case _ where iMC <= 25:
                imcText = ("Peso normal")
            case _ where iMC > 25:
                imcText = ("Sobre peso")
            default:
                print("Revisa los datos")
            }
        }
        
        return (iMC, imcText)
    }
    
    func esMayorDeEdad(edad: Int) -> String{
        if edad >= 18{
            return "Es mayor de edad"
        }else{
            return "Es menor de edad"
        }
    }
    func generaNSS() -> String{
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let NSS = String((0..<8).map{ _ in letters.randomElement()! })
        print(NSS)
        
        return NSS
    }
}
