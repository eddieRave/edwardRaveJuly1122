//
//  Pokemon.swift
//  Lecture
//
//  Created by Kevin McKenney on 8/16/22.
//

import SwiftUI

class Pokemon: Identifiable, ObservableObject {
    var id: Int
    var name: String
    var abilities: [String]
    var types: [String]

    var descriptions: [String] = []
    var predecessor: String?
    var successors: [String] = []
    
    var background: LinearGradient {
        var colors = types.map({ $0.typeColor })
        if colors.count == 1 { colors.append(.clear) }
        return LinearGradient(colors: colors, startPoint: .center, endPoint: .bottomTrailing)
    }
  
    //Create Pokemon from Model
    init(_ data: PokemonModel, pokedex: Pokedex) {
        id = data.id
        name = String(data.name.prefix(upTo: data.name.firstIndex(of: "-") ?? data.name.endIndex))
        abilities = data.abilities
        types = data.types

        //Get Species and Successors
        URLSession.shared.decode(from: Constants.speciesURL + String(id)) { (species: SpeciesModel) in
            self.descriptions = species.descriptions
            self.predecessor = species.predecessor
            URLSession.shared.decode(from: species.evolutionURL) { (evolution: EvolutionModel) in
                guard let evolvesTo = evolution.chain.evolvesTo else { return }
                
                if data.name == evolution.chain.first.name {
                    self.successors = evolvesTo.map({ $0.second.name })

                } else if let second = evolvesTo.first(where: { data.name == $0.second.name}) {
                    guard let evolvesToAgain = second.evolvesToAgain else { return }
                    self.successors = evolvesToAgain.map({ $0.third.name })
                }
            }
        }
        
  
    }
}

extension Pokemon: Comparable {
    static func < (lhs: Pokemon, rhs: Pokemon) -> Bool {
        lhs.id < rhs.id
    }
    
    static func == (lhs: Pokemon, rhs: Pokemon) -> Bool {
        lhs.id == rhs.id
    }
}
