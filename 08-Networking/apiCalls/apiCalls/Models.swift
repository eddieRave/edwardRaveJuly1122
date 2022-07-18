//
//  Models.swift
//  apiCalls
//
//  Created by Rave Bizz on 4/28/22.
//

import Foundation

struct Joke: Decodable {
    
    var value: String?
}

struct Drink: Decodable {
    
    var drinks: [Drin]?
}

struct Drin: Decodable {
    
    var strDrink: String?
}

struct Episode: Decodable {
    
    var name: String?

}

struct Music: Decodable {
    
    var feed: Feed?
}

struct Feed: Decodable {
    
    var results: [Artist]?
}

struct Artist: Decodable {
    
    var artistName: String?
}

//import Foundation
//
//struct JokeModel: Decodable{
//    let contents: Contents?
//}
//
//struct Jokes: Decodable{
//    let joke: Joke?
//}
//
//struct Contents: Decodable{
//    let jokes: [Jokes]?
//}
//
//struct Joke: Decodable{
//    let text: String?
//}
