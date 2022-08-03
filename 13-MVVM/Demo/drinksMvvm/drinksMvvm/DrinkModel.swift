//
//  DrinkModel.swift
//  drinksMvvm
//
//  Created by Rave Bizz on 5/5/22.
//

import Foundation

struct DrinkModel: Decodable {
    let drinks: [Drink]
    
    struct Drink: Decodable {
        let name: String
        let imageStr: String
        let id: String
        enum CodingKeys: String, CodingKey {
            case name = "strDrink"
            case imageStr = "strDrinkThumb"
            case id = "idDrink"
        }
    }
}
