//
//  SearchViewController.swift
//  SampleApp
//
//  Created by Struzinski, Mark on 2/19/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var searchTxt: UISearchBar!
    @IBOutlet weak var moviesTableView: UITableView!
    
//    var movies: [Movie] = [] {
//        didSet {
//            DispatchQueue.main.sync {
//                moviesTableView.reloadData()
//            }
//        }
//    } // MVC
    
    // Create an instance of the viewModel
    var movieVM = MovieViewModel()   // MVVM
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "MovieCell", bundle: nil)
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        moviesTableView.register(nib, forCellReuseIdentifier: "MovieCell")
        moviesTableView.rowHeight = UITableView.automaticDimension
        moviesTableView.estimatedRowHeight = 600
        searchBtn.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        guard let searchTerm = searchTxt.text else {
            print("type movie title")
            return
        }
        print(searchTerm)
        search(searchTerm: searchTerm)
    }
    
    func search(searchTerm: String) {
//        Network().getMovies(searchTerm: searchTerm) { movies in
//            self.movies = movies
//        }     // MVC
        // Fetch movies and reload data on the screen
        movieVM.fetchData(searchTerm: searchTerm) {
            self.moviesTableView.reloadData()
        }   // MVVM
        print("searched for movies")
    }
    
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return movies.count   // MVC
        return movieVM.movies.count   // MVVM
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = moviesTableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
//        cell.configure(movie: movies[indexPath.row])    // MVC
        let cellVM = movieVM.createCellVM(at: indexPath.row) // MVVM
        cell.configure(movie: cellVM)   // MVVM
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        #warning("Move model to ViewModel")
//        let movie = movies[indexPath.row]   // MVC
//        let posterPath = movie.poster_path ?? ""      // MVC
//        let imgUrl = Network.shared.baseImgUrl + posterPath     // MVC
        let storyBoard : UIStoryboard = UIStoryboard(name: "MovieDetail", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MovieDetailsViewController") as! MovieDetailViewController
//        nextViewController.movieDetailVM.movieTitle = movie.original_title     // MVC
//        nextViewController.movieDetailVM.releaseDate = movie.release_date     // MVC
//        nextViewController.movieDetailVM.descriptionText = movie.overview     // MVC
//        nextViewController.movieDetailVM.imgPath = imgUrl     // MVC
        movieVM.updateMovieInTable(index: indexPath.row, navCont: nextViewController)
        navigationController?.show(nextViewController, sender: nil)
    }
}
