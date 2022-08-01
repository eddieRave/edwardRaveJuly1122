//
//  MovieCellViewModel.swift
//  MovieBrowser
//
//  Created by Rave Bizz 41 on 7/31/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import Foundation


class MovieCellViewModel {
    
    var movie: Movie
    init(movie: Movie) {
        // self.movie refers to the movie var in this class and movie after = is the movie parameter for init
        self.movie = movie
    }
    
    //----------------------------------------
    // Returning the variables of Movie struct
    //----------------------------------------
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
    
    var poster_path: String {
        get {
            return movie.poster_path!
        }
    }
    
}
