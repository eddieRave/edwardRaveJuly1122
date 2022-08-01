//
//  PokedexViewModel.swift
//  PokedexApp
//
//  Created by Kevin McKenney on 7/29/22.
//

import Foundation

class PokedexViewModel {
    private var chainGroup = DispatchGroup()
    private var imageGroup = DispatchGroup()
    
    private var pokemonList: [Int: PokemonViewModel] = [:]
    private var chainObjectList: [Int: EvolutionChain] = [:]
    private var chainList: [Int: [String]] = [:]
    
    let totalPokemon = 200
    let totalChains = 257
    
    var pokemonCount: Int { pokemonList.count }
    
    func loadPokemon(completionHandler: @escaping () -> Void) {
        for chainID in 1...totalChains {
            self.chainGroup.enter()

            NetworkService.shared.fetchEvolutionChainData(for: chainID) { evolutionChain in
                guard let evolutionChain = evolutionChain else { self.chainGroup.leave(); return }
                self.chainObjectList.updateValue(evolutionChain, forKey: chainID)
                self.chainGroup.leave()
            }
        }
        
        for id in 1...totalPokemon {
            self.imageGroup.enter()
            
            NetworkService.shared.fetchPokemonData(for: id) { pokemon in
                self.pokemonList.updateValue(PokemonViewModel(pokemon), forKey: pokemon.id)
                
                NetworkService.shared.fetchPokemonSpeciesData(for: id) { species in
                    self.pokemonList[id]?.species = species
                }
                
                NetworkService.shared.fetchPokemonImageData(for: id) { image in
                    self.pokemonList[id]?.image = image
                    self.imageGroup.leave()
                }
            }
        }
        chainGroup.notify(queue: .global()) { self.formatEvolution() }
        imageGroup.notify(queue: .global()) { completionHandler() }
    }
    
    
    
    func getPokemonID(of pokemon: String) -> Int? {
        pokemonList.first(where: { $0.value.name.lowercased() == pokemon })?.key ?? nil
    }
    
    func getEntry(at index: Int) -> PokemonViewModel? {
        return pokemonList[index]
    }
    
    private func formatEvolution() {
        print("test3")
        chainObjectList.forEach {
            chainList.updateValue([], forKey: $0.key)
            
            let chain = $0.value.chain
            chainList[$0.key]?.append(chain.first.name)
            
            if chain.evolvesTo?.count ?? 0 >= 1 {
                
                guard let second = chain.evolvesTo?[0].second.name else {return}
                chainList[$0.key]?.append(second)
                
                if chain.evolvesTo?[0].evolvesToAgain?.count ?? 0 >= 1 {
                    
                    guard let third = chain.evolvesTo?[0].evolvesToAgain?[0].third.name else {return}
                    chainList[$0.key]?.append(third)
                }
            }
        }
    }
}

extension PokedexViewModel: Evolvable {
    func evolve(_ pokemon: String, in chainID: Int) -> PokemonViewModel? {
        guard let chain = chainList[chainID] else { return nil }
        guard let index = chain.firstIndex(where: { $0 == pokemon.lowercased() }) else { return nil }

        if chain.count > index + 1 {
            let successor = chain[index + 1]
            guard let successorID = getPokemonID(of: successor) else { return nil }
            return pokemonList[successorID]
        }
        else { return nil }
    }
    
    func devolve(to predecessor: String, in chainID: Int) -> PokemonViewModel? {
        guard let predecessorID = getPokemonID(of: predecessor) else { return nil }
        return pokemonList[predecessorID]
    }
}
protocol Evolvable {
    func evolve(_ pokemon: String, in chainID: Int) -> PokemonViewModel?
    
    func devolve(to pokemon: String, in chainID: Int) -> PokemonViewModel?
}
