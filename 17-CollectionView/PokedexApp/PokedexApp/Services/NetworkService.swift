//
//  NetworkService.swift
//  PokedexApp
//
//  Created by Kevin McKenney on 7/29/22.
//

import Foundation

struct NetworkService {
//    typealias Pokemon = PokemonList.Pokemon
    static var shared = NetworkService()
    private init() { }
    
    private let pokemonAPI = "https://pokeapi.co/api/v2/pokemon/"
    private let pokemonImageURL = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/"
    
    func fetchPokemonData(completionHandler: @escaping ([Pokemon]) -> Void) {
        guard let url = URL(string: pokemonAPI) else { return }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            guard let pokemonList = try? JSONDecoder().decode(PokemonList.self, from: data) else { print("error"); return }
            completionHandler(pokemonList.results)
        }.resume()
    }
    
    func fetchPokemonImageData(for id: Int, completionHandler: @escaping (Data) -> Void) {
        guard let url = URL(string: pokemonImageURL + String(id) + ".png") else { return }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            completionHandler(data)

        }.resume()
    }
}
//let decodedData = try JSONDecoder().decode(PokemonList.self, from: data)
//completionHandler(decodedData)
