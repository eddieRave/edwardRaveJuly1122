//
//  MovieVIewModel.swift
//  MovieBrowser
//
//  Created by Rave Bizz on 8/4/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import Foundation

protocol CellConfigurable{
    func getTitle(index: Int) -> String?
    func getReleaseDate(index: Int) -> String?
    func getAverage(index: Int) -> String?
}
class MovieVM: CellConfigurable{
    var movies: [Movie]? {
        didSet {
            DispatchQueue.main.sync {
                //                updateUI?()
                delegate?.reloadTable()
            }
        }
    }
    
    weak var delegate: TableReloadable?
    var updateUI: (() -> Void)?
    
    func fetchData(searchTerm: String){
        Network().getMovies(searchTerm: searchTerm) { movies in
            self.movies = movies
        }
        print("searched for movies")
    }
    
    func getCount() -> Int?{
        movies?.count
    }
    
    func getTitle(index: Int) -> String?{
        movies?[index].original_title
    }
    func getOverView(index: Int) -> String? {
        movies?[index].overview
    }
    
    func getImgUrl(index: Int) -> String? {
        return "\(Network().baseImgUrl)\(String(describing: movies?[index].poster_path))"
    }
    
    func getReleaseDate(index: Int) -> String?{
        movies?[index].release_date
    }
    
    
    func getAverage(index: Int) -> String?{
        if let average = movies?[index].vote_average{
           return String(average)
        }
        return nil
    }
}

