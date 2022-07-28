//
//  Network.swift
//  SampleApp
//
//  Created by Struzinski, Mark - Mark on 9/17/20.
//  Copyright © 2020 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class Network {
    // Add singleton pattern
    static let shared = Network()
    
    let apiKey = "5885c445eab51c7004916b9c0313e2d3"
    let baseImgUrl = "https://image.tmdb.org/t/p/w300/"
    
    func getMovies(searchTerm: String, completion: @escaping ([Movie]) -> Void) {
        let urlStr = "https://api.themoviedb.org/3/search/movie?api_key=\(self.apiKey)&language=en-US&query=\(formatSearchString(string: searchTerm))&page=1&include_adult=false"
        guard let url = URL(string: urlStr) else {
            print("invalid url")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("no data, networking error")
                return
            }
            guard let httpResonse = response as? HTTPURLResponse, httpResonse.statusCode == 200 else {
                print("http status code error")
                return
            }
            
            do {
                let feed = try JSONDecoder().decode(MovieModel.self, from: data)
                let movies = feed.results
                completion(movies)
            } catch {
                // decoding error
                print("parsing error")
                print(error)
            }
            
        }.resume()
        
    }
    
//    func getImage(imageUrl: String, completion: @escaping (UIImage?) -> Void) {   // MVC
    func getImage(imageUrl: String, completionGI: @escaping (Data?) -> Void) {   // MVVM
        guard let url = URL(string: imageUrl) else {
            print("invalid url")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("no data, networking error")
                return
            }
            
            guard
                let httpResonse = response as? HTTPURLResponse,
                httpResonse.statusCode == 200
            else {
                print("http status code error")
                return
            }
            completionGI(data)
//            if let image = UIImage(data: data) {
//                completion(image)
//            } else {
//                completion(nil)
//            }     MVC
        }.resume()
    }
}

extension Network {
    func formatSearchString(string: String) -> String {
        let words: [String] = string.components(separatedBy: " ")
        if words.count > 1 {
            return words.joined(separator: "%20")
        }
        return words[0]
    }
}
