//
//  ViagemDestaqueViewModel.swift
//  SmartViagens
//
//  Created by Flavia Vilar on 09/07/25.
//

import Foundation

class ViagemDestaqueViewModel: ViagemViewModel {
    var tituloSessao: String {
        return "Destaques"
    }
    
    var tipo: ViagemViewModelType {
        return .destaques
    }
    
    var viagens: [Viagem]
    
    var numeroDeLinhas: Int {
        return viagens.count
    }
    
    init(_ viagens: [Viagem]) {
        self.viagens = viagens
    }
}
