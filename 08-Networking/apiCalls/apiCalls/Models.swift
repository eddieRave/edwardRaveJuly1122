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
    let drinks: [OneDrink]?
}

struct OneDrink: Decodable {
    let strDrink: String?
}

struct Episode: Decodable {
    let name: String?
}

struct OneEpisode: Decodable {
    let name: String?
}

struct Music: Decodable {
    let feed: Feed?
}

struct Feed: Decodable {
    let results: [Album]?
}

struct Album: Decodable {
    let artistName: String?
}

