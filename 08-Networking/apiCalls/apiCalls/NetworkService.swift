//
//  NetworkService.swift
//  apiCalls
//
//  Created by Rave Bizz on 4/28/22.
//

import Foundation

let jokesStr = "https://api.chucknorris.io/jokes/random"
let drinksStr = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Gin"
let tvShowsStr = "https://api.tvmaze.com/shows/431/episodes"
let musicStr = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/10/albums.json"

/// Only pass the first items for testing purposes
class NetworkService {

    func fetchJoke(completion: @escaping (Joke?) -> Void) {
        
    }
    func fetchDrink(completion: @escaping (Drink?) -> Void) {
        
    }
    func fetchEpisode(completion: @escaping (Episode?) -> Void) {
        
    }
    func fetchMusic(completion: @escaping (Music?) -> Void) {
        
    }
}
