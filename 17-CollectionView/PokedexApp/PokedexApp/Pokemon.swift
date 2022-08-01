//
//  Pokemon.swift
//  PokedexApp
//
//  Created by Kevin McKenney on 7/30/22.
//

import Foundation

struct Pokemon: Codable {
    let name: String
    let id: Int
    let abilities: [AbilityObject]
    let types: [PokemonTypeObject]
    
    struct AbilityObject: Codable {
        let ability: PokemonAbility
        
        struct PokemonAbility: Codable {
            let name: String
        }
    }
    
    struct PokemonTypeObject: Codable {
        let type: PokemonType

        struct PokemonType: Codable {
            let name: String
        }
    }
}
