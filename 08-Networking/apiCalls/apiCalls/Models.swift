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

struct Drink: Decodable {
    let drinks: [Drink]
    struct Drink: Decodable {
        let strDrink: String?
    }
}

struct Episode: Decodable {
    let name: String?
}

struct Music: Decodable {
    let feed: Feed
    
    struct Feed: Decodable {
        let results: [Result]
        
        struct Result: Decodable {
            let artistName: String
        }
}
}
