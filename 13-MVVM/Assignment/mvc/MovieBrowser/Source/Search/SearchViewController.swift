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
    
    let viewModel = SearchViewModel()
    let movieViewModel = MovieViewModel()
    
    //    var movies: [Movie] = [] {
    //        didSet {
    //            DispatchQueue.main.sync {
    //                moviesTableView.reloadData()
    //            }
    //        }
    //    }
    
    
    func bindMovies() {
        viewModel.update = {
            DispatchQueue.main.async {
                self.moviesTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindMovies()
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
        //            self.viewModel.movies = movies
        //        }
        //        print("searched for movies")
        //    }
        viewModel.getData(for: searchTerm) {}
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getMovieCount()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = moviesTableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        cell.configure(movie: viewModel.getMovieAtCell(at: indexPath.row))
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = viewModel.getMovieAtCell(at: indexPath.row)
        let posterPath = movie.poster_path ?? ""
        let imgUrl = Network().baseImgUrl + posterPath
        let storyBoard : UIStoryboard = UIStoryboard(name: "MovieDetail", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MovieDetailsViewController") as! MovieDetailViewController
//        guard movie.original_title != nil else { return }
//        guard movie.release_date != nil else { return }
//        guard movie.overview != nil else { return }
        nextViewController.movieTitleLabel.text = movie.original_title
        nextViewController.releaseDateLabel.text = movie.release_date
        nextViewController.descriptionLabel.text = movie.overview
        movieViewModel.getImageData { image in
            
            nextViewController.movieImg.image = image
        }
        
        navigationController?.show(nextViewController, sender: nil)
    }
}
