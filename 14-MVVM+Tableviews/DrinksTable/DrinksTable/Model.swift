//
//  DrinkModel.swift
//  DrinksTable
//
//  Created by Joel Maldonado on 7/27/22.
//

import Foundation

struct DrinkModel: Decodable {
    let drinks: [Drink]
}

struct Drink: Decodable {
    let name: String
    let imageStr: String
    
    enum CodingKeys: String, CodingKey {
        case name = "strDrink"
        case imageStr = "strDrinkThumb"
    }
}
