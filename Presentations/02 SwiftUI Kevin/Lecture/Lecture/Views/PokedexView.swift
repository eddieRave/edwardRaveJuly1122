//
//  PokedexView.swift
//  Lecture
//
//  Created by Kevin McKenney on 8/13/22.
//

import SwiftUI

struct PokedexView: View {
    
    @EnvironmentObject var pokedex: Pokedex
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: Constants.width))]) {
                    ForEach(pokedex.pokemonList) { pokemon in
                        NavigationLink(destination: DetailView(pokemon: pokemon, disabledDirection: .none)) {
                            VStack {
                                Text(pokemon.name.capitalized).font(.system(size: Constants.font))
                                pokedex.images[pokemon.id]
                                Spacer()
                            }
                            .frame(width: Constants.width, height: Constants.height)
                            .background(RoundedRectangle(cornerRadius: Constants.font).borderAndFill(with: pokemon.background))
                        }
                    }
                    .tint(.black)
                    .navigationTitle("Pokedex")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
