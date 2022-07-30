//
//  SearchViewModel.swift
//  MovieBrowser
//
//  Created by Maher Damouni on 7/30/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import Foundation

class SearchViewModel {
    
    init() {}
    
    var movies: [Movie] = [] {
        didSet {
            update()
        }
    }
    
    var update: () -> Void = {}
    
    func getData(for searchTerm: String, completion: @escaping () -> Void) {
        Network().getMovies(searchTerm: searchTerm) { movies in
            self.movies = movies
            completion()
        }
        print("searched for movies")
    }
    
    func formatDate(dateString: String, inFormat: String = "yyyy/MM/dd", outFormat: String) -> String? {
        let dateFormatter = DateFormatter.posixFormatter
        dateFormatter.dateFormat = inFormat
        guard let date = dateFormatter.date(from: dateString) else { return nil }
        dateFormatter.dateFormat = outFormat
        return dateFormatter.string(from: date)
    }
    
    func getMovieCount() -> Int {
        movies.count
    }
    
    func getMovieAtCell(at index: Int) -> Movie {
        movies[index]
    }
        
}
