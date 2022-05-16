//
//  UserModel.swift
//  CalculadoraDeIMC
//
//  Created by Erick Gonzalez Arciniega on 16/05/22.
//

import Foundation

struct clienteModelo: Decodable{
    var clienteID: Int?
    var nombreUsuario: String?
    var password: String?
    var Nombre: String?
    var Apellidos: String?
    var email: String?
    var Edad: Int?
    var Estatura: Double?
    var Peso: Double?
    var generoID: Int?
    var actividadFisicaID: Int?
    var dietaID: Int?
    var objetivoID: Int?
    var IMC: Double?
    var GEB: Double?
    var ETA: Double?
    var pesoMax: Double?
    var pesoMin: Double?
    var AF: Double?
    var gastoEnergeticoTotal: Double?
    var tipoClienteID: Int?
    var Activo: Bool?
    var Orden: Int?
    var fechaCreacion: Date?
    var fechaActualizacion: Date?
    var usuarioID: Int?
    var Visible: Bool?
    var deSistema: Bool?

    enum CodingKeys: String, CodingKey{
        case clienteID = "Cliente_ID"
        case nombreUsuario = "Nombre_Usuario"
        case password = "Contraseña"
        case Nombre
        case Apellidos
        case email = "Correo_Electronico"
        case Edad
        case Estatura
        case Peso
        case generoID = "Genero_ID"
        case actividadFisicaID = "Actividad_Fisica_ID"
        case dietaID = "Dieta_ID"
        case objetivoID = "Objetivo_ID"
        case IMC
        case GEB
        case ETA
        case pesoMax = "Peso_Maximo"
        case pesoMin = "Peso_Minimo"
        case AF
        case gastoEnergeticoTotal = "Gasto_Energetico_Total"
        case tipoClienteID = "Tipo_Cliente_ID"
        case Activo
        case Orden
        case fechaCreacion = "Fecha_Creacion"
        case fechaActualizacion = "Fecha_Actualizacion"
        case usuarioID = "Usuario_ID"
        case Visible
        case deSistema = "De_Sistema"
    }

}

