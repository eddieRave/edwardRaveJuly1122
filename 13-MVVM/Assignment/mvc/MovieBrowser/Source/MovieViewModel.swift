//
//  MovieViewModel.swift
//  MovieBrowser
//
//  Created by Spencer Hurd on 7/26/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import Foundation

class MovieViewModel {
    
    var movies: [Movie] = []
    
    // Create a function to fetch data
    // Define completionHandler to reload data
    func fetchData(searchTerm: String, completion: @escaping () -> Void) {
        Network.shared.getMovies(searchTerm: searchTerm) { movies in
            for movie in movies {
                self.movies.append(movie)
            }
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func createCellVM(at index: Int) -> MovieCellViewModel {
        return MovieCellViewModel(movie: movies[index])
    }
    
}
