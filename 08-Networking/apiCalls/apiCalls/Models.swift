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
    let drinks: [StrDrink]?
    struct StrDrink: Decodable{
        let strDrink: String?
    }
}

struct Episode: Decodable {
    let name: String?
}
//"results": [
//    {
//      "artistName": "Bad Bunny",
struct Music: Decodable {
    let feed : Feed
    struct Feed: Decodable{
        let results: [Album]?
        struct Album: Decodable{
            let artistName: String?
        }
    }
    
}

