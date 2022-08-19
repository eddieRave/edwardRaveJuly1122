//
//  PokemonModel.swift
//  PokedexApp
//
//  Created by Kevin McKenney on 7/30/22.
//

import Foundation

struct PokemonModel {
    let id: Int
    let name: String
    let types: [String]
    let abilities: [String]
}

extension PokemonModel: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        
        types = try values.decode([PokemonTypeObject].self, forKey: .types).map({ $0.type.name })
        abilities = try values.decode([PokemonAbilityObject].self, forKey: .abilities).map({ $0.ability.name })
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case types
        case abilities
    }
    private struct PokemonTypeObject: Codable {
        let type: PokemonType
    }
    private struct PokemonType: Codable {
        let name: String
    }
    private struct PokemonAbilityObject: Codable {
        let ability: PokemonAbility
    }
    private struct PokemonAbility: Codable {
        let name: String
    }
}

