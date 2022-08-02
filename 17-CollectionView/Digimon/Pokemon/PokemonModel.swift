//
//  PokemonModel.swift
//  PokemonViewModel
//
//  Created by Kevin McKenney on 7/29/22.
//

import Foundation

struct PokemonList: Codable {
    
    let results: [Pokemon]
    
    struct Pokemon: Codable {
        let name: String
        let url: String
    }
}
