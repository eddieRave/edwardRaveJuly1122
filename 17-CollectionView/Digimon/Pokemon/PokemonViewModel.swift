//
//  PokemonViewModel.swift
//  PokemonViewModel
//
//  Created by Kevin McKenney on 7/29/22.
//

import Foundation

class PokemonViewModel {
    typealias Pokemon = PokemonList.Pokemon
    private var model: [Pokemon] = []

    func getPokemon(completionHandler: @escaping () -> Void) {
        NetworkService.shared.fetchDigimon { pokemonList in
            self.model = pokemonList.results
        }
    }
    
}
