//
//  PokemonViewModel.swift
//  PokedexApp
//
//  Created by Kevin McKenney on 7/30/22.
//

import Foundation

class PokemonViewModel {
    private var model: Pokemon
    
    var imageData: Data?
    var name: String { model.name.capitalized }
    
    init(_ pokemon: Pokemon) {
        self.model = pokemon
    }
    
    func getAbilities() -> String {
        var abilities = "Abilities\n"
        model.abilities.forEach {
            abilities.append("\t-\($0.ability.name.capitalized)\n")
        }
        return abilities
    }
}
