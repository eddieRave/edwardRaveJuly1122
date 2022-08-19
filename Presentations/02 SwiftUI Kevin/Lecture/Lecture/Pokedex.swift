//
//  Pokedex.swift
//  Lecture
//
//  Created by Kevin McKenney on 8/14/22.
//

import SwiftUI

class Pokedex: ObservableObject {
    
    @Published private(set) var pokemonList: [Pokemon] = []
    @Published var images: [Int: Image] = [:]

    init() {
        var loadingPokemon: [Pokemon] = []
        let group = DispatchGroup()
        
        //Capture Pokemon
        for id in 1...Constants.pokemonCount {
            group.enter()
            URLSession.shared.decode(from: Constants.pokemonURL + String(id)) { (data: PokemonModel) in
                loadingPokemon.append(Pokemon(data, pokedex: self))
                group.leave()
            }
            
            URLSession.shared.dataTask(with: id.imageURL!) { data, _, _ in
                guard let data = data else { return }
                guard let image = UIImage(data: data) else { return }
                
                DispatchQueue.main.async {
                    self.images.updateValue(Image(uiImage: image).resizable(), forKey: id)
                }
            }
            .resume()
        }

        //When all Pokemon are loaded, Sort and Save
        group.notify(queue: .main) {
            self.pokemonList = loadingPokemon.sorted()
        }
    }
    
    func getPokemon(_ named: String?) -> Pokemon? {
        pokemonList.first(where: { $0.name == named })
    }
}
