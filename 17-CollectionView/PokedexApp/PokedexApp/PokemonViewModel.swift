//
//  PokemonViewModel.swift
//  PokedexApp
//
//  Created by Kevin McKenney on 7/30/22.
//

import Foundation
import UIKit

class PokemonViewModel {
    var data: Pokemon
    
    var species: PokemonSpecies?
    var image: UIImage?
    
    var name: String { data.name.capitalized }
    
    private var abilityList: [String] { data.abilities.map { $0.ability.name } }
    private var types: [String] { data.types.map { $0.type.name } }
    
    var hasTwoTypes: Bool { types.count > 1 }
    var type1: String { types[0] }
    var type2: String? { hasTwoTypes ? types[1] : nil }
    
    var evolutionChainID: Int {
        guard var url = species?.evolutionChain.url else { return 0 }
        url.removeLast()
        
        guard let slashIndex = url.lastIndex(of: "/") else { return 0 }
        var suffix = url.suffix(from: slashIndex)
        
        suffix.removeFirst()
        return Int(suffix) ?? 0
    }
    
    var predecessor: String? { species?.predecessor?.name }
    var successors: [String]?
    
    init(_ pokemon: Pokemon) { self.data = pokemon }
    
    var description: String { species?.descriptions[0].text ?? "" }
    var abilities: String {
        var output = ""
        abilityList.forEach {
            output.append("\t-\($0.capitalized)\n")
        }
        output.removeLast()
        return output
    }
    
    func getGradientColors() -> [CGColor] {
        var gradientColors: [CGColor] = []
        gradientColors = [type1.typeColor().cgColor]
        gradientColors += hasTwoTypes ? [type2!.typeColor().cgColor] : [UIColor.clear.cgColor]
        return gradientColors
    }
}

extension String {
    func typeColor() -> UIColor {
        switch self {
        case "bug":
            return UIColor(red: 0.65, green: 0.73, blue: 0.10, alpha: 1.00)
        case "dark":
            return UIColor(red: 0.44, green: 0.34, blue: 0.27, alpha: 1.00)
        case "dragon":
            return UIColor(red: 0.44, green: 0.21, blue: 0.99, alpha: 1.00)
        case "electric":
            return UIColor(red: 0.97, green: 0.82, blue: 0.17, alpha: 1.00)
        case "fairy":
            return UIColor(red: 0.84, green: 0.52, blue: 0.68, alpha: 1.00)
        case "fighting":
            return UIColor(red: 0.76, green: 0.18, blue: 0.16, alpha: 1.00)
        case "fire":
            return UIColor(red: 0.93, green: 0.51, blue: 0.19, alpha: 1.00)
        case "flying":
            return UIColor(red: 0.66, green: 0.56, blue: 0.95, alpha: 1.00)
        case "ghost":
            return UIColor(red: 0.45, green: 0.34, blue: 0.59, alpha: 1.00)
        case "grass":
            return UIColor(red: 0.48, green: 0.78, blue: 0.30, alpha: 1.00)
        case "ground":
            return UIColor(red: 0.88, green: 0.75, blue: 0.41, alpha: 1.00)
        case "ice":
            return UIColor(red: 0.59, green: 0.85, blue: 0.84, alpha: 1.00)
        case "normal":
            return UIColor(red: 0.66, green: 0.65, blue: 0.48, alpha: 1.00)
        case "poison":
            return UIColor(red: 0.64, green: 0.24, blue: 0.63, alpha: 1.00)
        case "psychic":
            return UIColor(red: 0.98, green: 0.33, blue: 0.53, alpha: 1.00)
        case "rock":
            return UIColor(red: 0.72, green: 0.63, blue: 0.22, alpha: 1.00)
        case "steel":
            return UIColor(red: 0.72, green: 0.72, blue: 0.81, alpha: 1.00)
        case "water":
            return UIColor(red: 0.39, green: 0.56, blue: 0.94, alpha: 1.00)
        default:
            return .black
        }
    }
    
}
