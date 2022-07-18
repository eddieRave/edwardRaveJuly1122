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
/*
 {
    "categories":[],
    "created_at":"2020-01-05 13:42:30.177068",
    "icon_url":"https://assets.chucknorris.host/img/avatar/chuck-norris.png",
    "id":"-vZWD2GgTjaf1PO7F2kgng",
    "updated_at":"2020-01-05 13:42:30.177068",
    "url":"https://api.chucknorris.io/jokes/-vZWD2GgTjaf1PO7F2kgng",
    "value":"Chuck Norris doesn't drink water he drinks sulfuric acid with a hint of lemon"
 }
 */

struct Drink: Decodable {
    
}

struct Episode: Decodable {
    
}

struct Music: Decodable {
    
}

