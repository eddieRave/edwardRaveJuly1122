//
//  NetworkService.swift
//  PokedexApp
//
//  Created by Kevin McKenney on 7/29/22.
//

import Foundation
import UIKit

struct NetworkService {
    static var shared = NetworkService()
    private init() { }
    
    private let pokemonAPI = "https://pokeapi.co/api/v2/"
    private let pokemonImageURL = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/"
    
    func fetchPokemonData(for id: Int, completionHandler: @escaping (Pokemon) -> Void) {
        guard let url = URL(string: pokemonAPI + "pokemon/" + String(id)) else { return }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            guard let pokemon = try? JSONDecoder().decode(Pokemon.self, from: data) else { return }
            completionHandler(pokemon)
        }.resume()
    }
    
    func fetchPokemonSpeciesData(for id: Int, completionHandler: @escaping (PokemonSpecies) -> Void) {
        guard let url = URL(string: pokemonAPI + "pokemon-species/" + String(id)) else { return }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            guard let species = try? JSONDecoder().decode(PokemonSpecies.self, from: data) else { return }
            completionHandler(species)
        }.resume()
    }
    
    func fetchEvolutionChainData(for id: Int, completionHandler: @escaping (EvolutionChain?) -> Void) {
        guard let url = URL(string: pokemonAPI + "evolution-chain/" + String(id)) else { return }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            do {
                guard let data = data else { return }
                let chain = try JSONDecoder().decode(EvolutionChain.self, from: data)
                completionHandler(chain)
            } catch {
                completionHandler(nil)
            }
        }.resume()
    }
    
    func fetchPokemonImageData(for id: Int, completionHandler: @escaping (UIImage) -> Void) {
        guard let url = URL(string: pokemonImageURL + String(id) + ".png") else { return }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            guard let image = UIImage(data: data) else { return }
            completionHandler(image)

        }.resume()
    }
}
//let decodedData = try JSONDecoder().decode(PokemonList.self, from: data)
//completionHandler(decodedData)
