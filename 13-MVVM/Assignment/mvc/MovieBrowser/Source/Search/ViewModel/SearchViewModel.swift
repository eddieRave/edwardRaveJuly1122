//
//  SearchViewModel.swift
//  MovieBrowser
//
//  Created by Joel Maldonado on 7/26/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import Foundation

class SearchViewModel {
    var model = SearchModel()
    
    var numMovies: Int {
        model.movies.count
    }
    
    func search(for searchTerm: String, completion: @escaping () -> Void) {
        Network.shared.getMovies(searchTerm: searchTerm) { movies in
            for movie in movies {
                self.model.movies.append(MovieViewModel(movie: movie))
            }
            
            DispatchQueue.main.async {
                completion()
            }
        }
        
    }
    
    func getMovie(at index: Int) -> Movie {
        model.movies[index].movie
    }
    
    func getViewModel(at index: Int) -> MovieViewModel {
        model.movies[index]
    }
    
}
