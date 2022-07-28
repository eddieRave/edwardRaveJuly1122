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
    
    
//    var drink: DrinkModel.Drink
//    var drinkName: String {
//        drink.name
//    }
//    var imageData: Data? {
//        didSet {
//            DispatchQueue.main.async {
//                self.updateImage()
//            }
//        }
//    }
//    var updateImage: () -> Void = { print("closure")}
//    init(drink: DrinkModel.Drink) {
//        self.drink = drink
//    }
//    func fetchImage() {
//        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
//            Webservice.shared.getImageData(imageUrl: self.drink.imageStr) { data in
//                self.imageData = data
//            }
//        }
//    }
