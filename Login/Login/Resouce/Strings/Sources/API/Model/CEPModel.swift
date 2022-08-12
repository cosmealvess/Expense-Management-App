//
//  CEPModel.swift
//  Login
//
//  Created by COSME D ALVES SILVA on 30/7/2022.
//

import Foundation


struct CEPModel: Codable {
        let uf: String?
        let cidade: String?
        let bairro: String?
        let tipoLogradouro: String?
        let logradouro: String?
        let resultado: String?
        let resultadoTxt: String?

        enum CodingKeys: String, CodingKey {
            case uf, cidade, bairro
            case tipoLogradouro = "tipo_logradouro"
            case logradouro, resultado
            case resultadoTxt = "resultado_txt"
        }
}
