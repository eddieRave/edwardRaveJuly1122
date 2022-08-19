//
//  SpeciesModel.swift
//  PokedexApp
//
//  Created by Kevin McKenney on 7/31/22.
//

import Foundation

struct SpeciesModel {
    var evolutionURL: String
    var predecessor: String?
    var descriptions: [String]
}

extension SpeciesModel: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        let evoltion = try values.nestedContainer(keyedBy: EvolutionKeys.self, forKey: .evolution)
        evolutionURL = try evoltion.decode(String.self, forKey: .url)
        
        let predecessorObject = try values.decode([String: String]?.self, forKey: .predecessor)
        predecessor = predecessorObject?["name"]
        
        let descriptionList = try values.decode([Description].self, forKey: .descriptions)
        descriptions = descriptionList.map({ $0.text })
    }
    
    private enum CodingKeys: String, CodingKey {
        case evolution = "evolution_chain"
        case predecessor = "evolves_from_species"
        case descriptions = "flavor_text_entries"
    }
    private enum EvolutionKeys: String, CodingKey {
        case url
    }
    private struct Description: Codable {
        let text: String
        
        private enum CodingKeys: String, CodingKey {
            case text = "flavor_text"
        }
    }
}

