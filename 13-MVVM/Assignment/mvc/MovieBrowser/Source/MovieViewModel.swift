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
    
    func fetchImgUrl(posterPath: String) -> String {
        Network.shared.baseImgUrl + posterPath
    }
    
    func createCellVM(at index: Int) -> MovieCellViewModel {
        return MovieCellViewModel(movie: movies[index])
    }
    
    func updateMovieInTable(index: Int, navCont: MovieDetailViewController) {
        let movie = movies[index]   // MVVM
        let posterPath = movie.poster_path ?? ""
//        let imgUrl = Network.shared.baseImgUrl + posterPath     // MVC
        let imgUrl = fetchImgUrl(posterPath: posterPath)     // MVVM
        navCont.movieDetailVM.movieTitle = movie.original_title
        navCont.movieDetailVM.releaseDate = movie.release_date
        navCont.movieDetailVM.descriptionText = movie.overview
        navCont.movieDetailVM.imgPath = imgUrl     // MVC
    }
    
}
