//
//  Models.swift
//  apiCalls
//
//  Created by Rave Bizz on 4/28/22.
//

import Foundation
// Use https://jsonformatter.org/json-pretty-print to make JSON format more readable

struct Joke: Decodable {
    let value: String?
}

/*
"drinks": [
    {
      "strDrink": "3-Mile Long Island Iced Tea",
      "strDrinkThumb": "https://www.thecocktaildb.com/images/media/drink/rrtssw1472668972.jpg",
      "idDrink": "15300"
    }*/
struct DrinkArr: Decodable {
    let drinks: [Drink]
    struct Drink: Decodable {
        let strDrink: String?
    }
}

struct Episode: Decodable {
    let name: String?
}

struct Music: Decodable {
    let artistName: String?
}

