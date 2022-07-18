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
    
    static let shared = NetworkService()
    public init(){}
    
    func fetchJoke(completion: @escaping (Joke) -> Void) {
        
        guard let url = URL(string: jokesStr) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) {
            data, response, error in
            
            if let data = data {
                do {
                    let decodedData  = try JSONDecoder().decode(Joke.self, from: data)
//                    print("JOKE HERE >>>>>", decodedData)
                    completion(decodedData)
                } catch  {
                    print(error)
                }
            }
        }.resume()
        
    }
    func fetchDrink(completion: @escaping (Drink?) -> Void) {
        
        guard let url = URL(string: drinksStr) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) {
            data, response, error in
            
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(Drink.self, from: data)
                    completion(decodedData)
                } catch {
                    print(error)
                }
            }
        }.resume()
        
    }
    func fetchEpisode(completion: @escaping (Episode?) -> Void) {
        
        guard let url = URL(string: tvShowsStr) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) {
            data, response, error in
            
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode([Episode].self, from: data)
                    completion(decodedData.first)
                } catch {
                    print(error)
                }
            }
        }.resume()
        
    }
    func fetchMusic(completion: @escaping (Music?) -> Void) {
        
        
        guard let url = URL(string: musicStr) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) {
            data, response, error in
            
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(Music.self, from: data)
                    completion(decodedData)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
}
