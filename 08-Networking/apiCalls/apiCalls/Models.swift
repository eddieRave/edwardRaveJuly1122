//
//  Models.swift
//  apiCalls
//
//  Created by Rave Bizz on 4/28/22.
//

import Foundation

struct Joke: Decodable {
    let value: String?
}

struct DrinkList: Decodable {
    let drinks: [Drink]?
    
    struct Drink: Decodable {
        let strDrink: String?
    }
}

struct Episode: Decodable {
    let name: String?
}

struct Music: Decodable {
    let feed: Feed?
    
    struct Feed: Decodable {
        let results: [Album]?
        
        struct Album: Decodable {
            let artistName: String?
        }
    }
}

