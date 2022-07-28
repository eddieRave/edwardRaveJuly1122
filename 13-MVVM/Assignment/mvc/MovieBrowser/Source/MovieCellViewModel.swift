//
//  MovieCellViewModel.swift
//  MovieBrowser
//
//  Created by Spencer Hurd on 7/27/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import Foundation

class MovieCellViewModel {
    
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    var original_title: String {
        get {
            return movie.original_title
        }
    }
    var release_date: String {
        get {
            return movie.release_date
        }
    }
    var vote_average: Float {
        get {
            return movie.vote_average
        }
    }
    var overview: String {
        get {
            return movie.overview
        }
    }
    var poster_path: String? {
        get {
            return movie.poster_path
        } 
    }
    
}
