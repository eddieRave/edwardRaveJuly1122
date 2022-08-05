//
//  SearchViewController.swift
//  SampleApp
//
//  Created by Struzinski, Mark on 2/19/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit
protocol TableReloadable: AnyObject{
    func reloadTable()
}
class SearchViewController: UIViewController, TableReloadable{
    
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var searchTxt: UISearchBar!
    @IBOutlet weak var moviesTableView: UITableView!
    
//    var movies: [Movie] = [] {
//        didSet {
//            DispatchQueue.main.sync {
//                moviesTableView.reloadData()
//            }
//        }
//    }
    let viewModel = MovieVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // with protocols good if used multiple times ~mahr
        viewModel.delegate = self
        // passing raw function
        viewModel.updateUI = {
            [weak self] in
            self?.moviesTableView.reloadData()
        }
        
        let nib = UINib(nibName: "MovieCell", bundle: nil)
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        moviesTableView.register(nib, forCellReuseIdentifier: "MovieCell")
        moviesTableView.rowHeight = UITableView.automaticDimension
        moviesTableView.estimatedRowHeight = 600
        searchBtn.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    func reloadTable(){
        moviesTableView.reloadData()
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
//        }
        viewModel.fetchData(searchTerm: searchTerm)
        
        print("searched for movies")
    }
    
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getCount() ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = moviesTableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        cell.configure(delegate: viewModel, index: indexPath.row)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let movie = movies[indexPath.row]
        let i = indexPath.row
        guard let title = viewModel.getTitle(index: i), let overView = viewModel.getOverView(index: i), let imgUrl = viewModel.getImgUrl(index: i), let release = viewModel.getReleaseDate(index: i)  else{
            return
        }
       
//        let posterPath = movie.poster_path ?? ""
//        let imgUrl = Network().baseImgUrl + posterPath
        let storyBoard : UIStoryboard = UIStoryboard(name: "MovieDetail", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MovieDetailsViewController") as! MovieDetailViewController
        
        nextViewController.movieTitle = title
        nextViewController.releaseDate = release
        nextViewController.descriptionText = overView
        nextViewController.imgPath = imgUrl

        navigationController?.show(nextViewController, sender: nil)
    }
}
