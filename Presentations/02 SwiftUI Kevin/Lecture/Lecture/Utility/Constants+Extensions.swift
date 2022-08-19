//
//  Constants+Extensions.swift
//  Lecture
//
//  Created by Kevin McKenney on 8/14/22.
//

import SwiftUI


struct Constants {
    static let pokemonCount = 900
    
    //Pokemon API URLs
    static let baseURL = "https://pokeapi.co/api/v2/"
    static let pokemonURL = baseURL + "pokemon/"
    static let speciesURL = baseURL + "pokemon-species/"
    static let baseImageURL = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/"
    
    //CG Constants
    static let width: CGFloat = 120
    static var height: CGFloat { width * 5 / 4 }
    static var font: CGFloat { width / 6 }
}

extension Int {
    
    var imageURL: URL? {
        URL(string: Constants.baseImageURL + String(self) + ".png")
    }
}

extension String {
    
    
    //RGB Color for each Pokemon Type
    var typeColor: Color {
        switch self {
        case "bug":
            return Color(red: 0.65, green: 0.73, blue: 0.10)
        case "dark":
            return Color(red: 0.44, green: 0.34, blue: 0.27)
        case "dragon":
            return Color(red: 0.44, green: 0.21, blue: 0.99)
        case "electric":
            return Color(red: 0.97, green: 0.82, blue: 0.17)
        case "fairy":
            return Color(red: 0.84, green: 0.52, blue: 0.68)
        case "fighting":
            return Color(red: 0.76, green: 0.18, blue: 0.16)
        case "fire":
            return Color(red: 0.93, green: 0.51, blue: 0.19)
        case "flying":
            return Color(red: 0.66, green: 0.56, blue: 0.95)
        case "ghost":
            return Color(red: 0.45, green: 0.34, blue: 0.59)
        case "grass":
            return Color(red: 0.48, green: 0.78, blue: 0.30)
        case "ground":
            return Color(red: 0.88, green: 0.75, blue: 0.41)
        case "ice":
            return Color(red: 0.59, green: 0.85, blue: 0.84)
        case "normal":
            return Color(red: 0.66, green: 0.65, blue: 0.48)
        case "poison":
            return Color(red: 0.64, green: 0.24, blue: 0.63)
        case "psychic":
            return Color(red: 0.98, green: 0.33, blue: 0.53)
        case "rock":
            return Color(red: 0.72, green: 0.63, blue: 0.22)
        case "steel":
            return Color(red: 0.72, green: 0.72, blue: 0.81)
        case "water":
            return Color(red: 0.39, green: 0.56, blue: 0.94)
        default:
            return .clear
        }
    }
}

extension URLSession {
    func decode<Model>(from urlString: String, completionHandler: @escaping (Model) -> Void) where Model: Decodable {
        guard let url = URL(string: urlString) else { return }
        
        self.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            guard let decodedData = try? JSONDecoder().decode(Model.self, from: data) else { return }
            completionHandler(decodedData)
        }
        .resume()
    }
}


extension RoundedRectangle {
    func borderAndFill(with gradient: LinearGradient) -> some View {
        ZStack {
            self.fill(gradient)
            self.stroke()
        }
    }
}

enum Evolution {
    case devolve
    case evolve
    case none
    
    var opposite: Evolution {
        switch self {
        case .devolve:
            return .evolve
        case .evolve:
            return .devolve
        case .none:
            return .none
        }
    }
}
