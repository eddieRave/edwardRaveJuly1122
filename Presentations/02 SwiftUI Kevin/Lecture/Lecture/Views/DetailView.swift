//
//  DetailView.swift
//  Lecture
//
//  Created by Kevin McKenney on 8/14/22.
//

import SwiftUI
import MapKit

struct DetailView: View {
    
    
    @EnvironmentObject var pokedex: Pokedex
    var pokemon: Pokemon
    var disabledDirection: Evolution

    @State var showNext = false
    @State var nextDirection: Evolution?
    @State var nextPokemon: Pokemon?
    
    var hideDevolve: Bool { pokemon.predecessor == nil || disabledDirection == .devolve }
    var hideEvolve: Bool { pokemon.successors.isEmpty || disabledDirection == .evolve }
    
    var body: some View {
        ZStack {
            if showNext {
                DetailView(pokemon: nextPokemon!, disabledDirection: nextDirection!.opposite)
            } else {
                VStack{
                    //Type Icons
                    HStack {
                        ForEach(pokemon.types, id: \.self) {
                            Image($0)
                        }
                    }
                    Spacer()
                    
                    //Pokemon Image
                    pokedex.images[pokemon.id]
                    
                    //Evolution Links
                        HStack {
                            pokemonLink(to: pokedex.getPokemon(pokemon.predecessor), direction: .devolve)
                            ScrollView {
                                ForEach(pokemon.successors, id: \.self) { successor in
                                    pokemonLink(to: pokedex.getPokemon(successor), direction: .evolve)
                                }
                            }
                            .frame(width: Constants.width, height: Constants.width)
                        }
                        .frame(height: Constants.width)
                    
                    //Detail Text
                    HStack(alignment: .top) {
                        VStack(alignment: .leading) {
                            Text("Abilities:").font(.title)
                            ForEach(pokemon.abilities, id: \.self) { ability in
                                Text("\t" + ability.capitalized).font(.title3)
                            }
                        }
                        .padding()
                        Spacer()
                        Text(pokemon.descriptions.first ?? "")
                            .font(.caption)
                            .padding()
                    }
                }
                .background {
                    pokemon.background.ignoresSafeArea()
                }
                .navigationTitle(pokemon.name.capitalized)
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
    
    //Link to Preceding or Succeeding Pokemon in Evolution Chain
    @ViewBuilder private func pokemonLink(to nextPokemon: Pokemon?, direction: Evolution) -> some View {
        if disabledDirection != direction, let nextPokemon = nextPokemon {
            Button(action: {
                withAnimation {
                    nextDirection = direction; self.nextPokemon = nextPokemon; showNext = true
                }
            }) {
                pokedex.images[nextPokemon.id].aspectRatio(contentMode: .fit)
            }
        } else { Rectangle().opacity(0).frame(width: Constants.width) }
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}43.195,-70.875
