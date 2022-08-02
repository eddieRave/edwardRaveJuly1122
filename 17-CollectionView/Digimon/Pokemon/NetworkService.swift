//
//  NetworkService.swift
//  PokemonViewModel
//
//  Created by Kevin McKenney on 7/29/22.
//

import Foundation

struct NetworkService {
    typealias Pokemon = PokemonList.Pokemon
    static var shared = NetworkService()
    private init() { }
    
    private let pokemonAPI = "https://pokeapi.co/api/v2/pokemon?limit=151"
    
    func fetchDigimon(completionHandler: @escaping (PokemonList) -> Void) {
        guard let url = URL(string: pokemonAPI) else { return }
        
        URLSession.shared.dataTask(with: url) { data,_,error in
            do {
                guard let data = data else { return }
                let decodedData = try JSONDecoder().decode(PokemonList.self, from: data)
                completionHandler(decodedData)
            } catch {
                print(error)
            }
        }
    }
}
