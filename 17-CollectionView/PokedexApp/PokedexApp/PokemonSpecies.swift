//
//  PokemonSpecies.swift
//  PokedexApp
//
//  Created by Kevin McKenney on 7/31/22.
//

import Foundation

struct PokemonSpecies: Codable {
    let evolutionChain: EvolutionChain
    let predecessor: Predecessor?
    let descriptions: [DescriptionObject]
    
    enum CodingKeys: String, CodingKey {
        case evolutionChain = "evolution_chain"
        case predecessor = "evolves_from_species"
        case descriptions = "flavor_text_entries"
    }
    
    struct EvolutionChain: Codable {
        let url: String
    }
    
    struct Predecessor: Codable {
        let name: String
    }
    
    struct DescriptionObject: Codable {
        let text: String
        
        enum CodingKeys: String, CodingKey {
            case text = "flavor_text"
        }
    }
}
