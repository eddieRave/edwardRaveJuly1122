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
    
    var pokemonList: [Int: PokemonViewModel] = [:]
    private var chainList: [Int: EvolutionObject] = [:]
    
    let totalPokemon = 250
    let totalChains = 257
    
    var pokemonCount: Int { pokemonList.count }
    
    func loadPokemon(completionHandler: @escaping () -> Void) {
        
        for id in 1...totalPokemon {
            self.imageGroup.enter()
            self.chainGroup.enter()
            
            NetworkService.shared.fetchPokemonData(for: id) { pokemon in
                self.pokemonList.updateValue(PokemonViewModel(pokemon), forKey: pokemon.id)
                
                NetworkService.shared.fetchPokemonSpeciesData(for: id) { species in
                    self.pokemonList[id]?.species = species
                }
                
                NetworkService.shared.fetchPokemonImageData(for: id) { image in
                    self.pokemonList[id]?.image = image
                    self.imageGroup.leave()
                    self.chainGroup.leave()
                }
            }
        }
        for chainID in 1...totalChains {
            self.chainGroup.enter()
            
            NetworkService.shared.fetchEvolutionChainData(for: chainID) { evolutionChain in
                guard let evolutionChain = evolutionChain else { self.chainGroup.leave(); return }
                self.chainList.updateValue(evolutionChain, forKey: chainID)
                self.chainGroup.leave()
            }
        }
        chainGroup.notify(queue: .global()) { self.assignSuccessors() }
        imageGroup.notify(queue: .global()) { completionHandler() }
    }
    
    
    
    func getPokemonID(of pokemon: String) -> Int? {
        pokemonList.first(where: { $0.value.name.lowercased() == pokemon })?.key ?? nil
    }
    
    func getEntry(at index: Int) -> PokemonViewModel? {
        return pokemonList[index]
    }
    
    private func assignSuccessors() {
        pokemonList.forEach { pokemon in
            guard let chain = chainList[pokemon.value.evolutionChainID]?.chain else { return }
            guard let evolvesTo = chain.evolvesTo else { return }
            let name = pokemon.value.name.lowercased()
            let seconds = evolvesTo.map({ $0.second.name })
            
            if name == chain.first.name {
                pokemon.value.successors = seconds
            } else if seconds.contains(name) {
                guard let index = seconds.firstIndex(of: name) else { return }
                guard let evolvesToAgain = evolvesTo[index].evolvesToAgain else { return }
                pokemon.value.successors = evolvesToAgain.map({ $0.third.name })
            }
        }
    }
}

extension PokedexViewModel: Evolvable {
    func evolve(to successors: [String]) -> [PokemonViewModel]? {
        let successorIDs = successors.map { getPokemonID(of: $0) }
        let successorModels = pokemonList
            .filter({ pokemon in successorIDs.contains { $0 == pokemon.key } })
            .map({ $0.value })
        
        return successorModels
    }
    
    func devolve(to predecessor: String) -> PokemonViewModel? {
        guard let predecessorID = getPokemonID(of: predecessor) else { return nil }
        return pokemonList[predecessorID]
    }
}
protocol Evolvable {
    func evolve(to successors: [String]) -> [PokemonViewModel]?
    
    func devolve(to predecessor: String) -> PokemonViewModel?
}
