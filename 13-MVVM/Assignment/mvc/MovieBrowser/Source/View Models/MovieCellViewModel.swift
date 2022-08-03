//
//  MovieCellViewModel.swift
//  MovieBrowser
//
//  Created by Rave Bizz 63 on 8/3/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import Foundation

class MovieCellViewModel {
    
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    var original_title: String {
        movie.original_title
    }
    var release_date: String {
        movie.release_date
        
    }
    var vote_average: Float {
        movie.vote_average
    }
    var overview: String {
        movie.overview
    }
    var poster_path: String? {
        movie.poster_path
    }
    
}
