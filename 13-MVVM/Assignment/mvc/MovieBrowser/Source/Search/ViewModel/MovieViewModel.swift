//
//  MovieCellViewModel.swift
//  MovieBrowser
//
//  Created by Joel Maldonado on 7/26/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import Foundation

class MovieViewModel {
    let movie: Movie
    
    var movieTitle: String {
        movie.original_title
    }
    
    var date: String {
        movie.release_date
    }
    
    var overview: String {
        movie.overview
    }
    
    var imgData: Data? {
        didSet {
            self.updateImg()
        }
    }
    
    var updateImg: () -> Void = {}
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    func fetchImage() {
        guard let posterPath = movie.poster_path else { return }
        DispatchQueue.main.async {
            Network.shared.getImage(imageUrl: posterPath) { data in
                self.imgData = data
            }
        }
    }
}
