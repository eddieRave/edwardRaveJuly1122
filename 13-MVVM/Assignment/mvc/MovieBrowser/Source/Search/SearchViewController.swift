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
        viewModel.search(for: searchTerm) { [weak self] in
            self?.moviesTableView.reloadData()
        }
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numMovies
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = moviesTableView.dequeueReusableCell(withIdentifier: MovieCell.identifier) as! MovieCell
        cell.configure(movie: viewModel.getMovie(at: indexPath.row))
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "MovieDetail", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MovieDetailsViewController") as! MovieDetailViewController
        
        nextViewController.viewModel = viewModel.getViewModel(at: indexPath.row)

        navigationController?.show(nextViewController, sender: nil)
    }
}
