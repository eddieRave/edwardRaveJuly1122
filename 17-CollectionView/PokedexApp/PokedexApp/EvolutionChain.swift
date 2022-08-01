//
//  EvolutionChain.swift
//  PokedexApp
//
//  Created by Kevin McKenney on 7/31/22.
//

import Foundation

struct EvolutionChain: Codable {
    let chain: Chain
    
    struct Chain: Codable {
        let first: First
        let evolvesTo: [EvolvesTo]?
        
        enum CodingKeys: String, CodingKey {
            case first = "species"
            case evolvesTo = "evolves_to"
        }
        
        struct First: Codable {
            let name: String
        }
        
        struct EvolvesTo: Codable {
            let second: Second
            let evolvesToAgain: [EvolvesToAgain]?

            enum CodingKeys: String, CodingKey {
                case second = "species"
                case evolvesToAgain = "evolves_to"
            }

            struct Second: Codable {
                let name: String
            }

            struct EvolvesToAgain: Codable {
                let third: Third

                struct Third: Codable {
                    let name: String
                }

                enum CodingKeys: String, CodingKey {
                    case third = "species"
                }
            }
        }
    }
}
