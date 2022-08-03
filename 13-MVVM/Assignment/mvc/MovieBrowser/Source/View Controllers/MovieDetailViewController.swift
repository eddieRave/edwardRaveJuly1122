//
//  MovieDetailViewController.swift
//  SampleApp
//
//  Created by Struzinski, Mark on 2/26/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!
    @IBOutlet weak var movieImg: UIImageView!
    
//    Must movie this into it's own view model to start
//    var movieTitle: String = "no title"
//    var releaseDate: String = "no release date"
//    var descriptionText: String = "no description"
//    var imgPath: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieImg.image = UIImage(named: "placeholder")
        configure()
    }
    
    var movieDetailViewModel = MovieDetailViewModel()
    
    func configure() {
        guard let date = formatDate(dateString: self.movieDetailViewModel.releaseDate, outFormat: "M/d/yy") else { return }
        movieTitleLabel.text = self.movieDetailViewModel.movieTitle
        releaseDateLabel.text = "Release Date: \(date)"
        descriptionLabel.text = self.movieDetailViewModel.descriptionText
        getPoster()
    }
    
    func getPoster() {
        Network().getImage(imageUrl: imgPath) { image in
            DispatchQueue.main.async {
                self.movieImg.image = image
            }
        }
    }
    
    func formatDate(dateString: String, inFormat: String = "yyyy/MM/dd", outFormat: String) -> String? {
        let dateFormatter = DateFormatter.posixFormatter
        dateFormatter.dateFormat = inFormat
        guard let date = dateFormatter.date(from: dateString) else { return nil }
        dateFormatter.dateFormat = outFormat
        return dateFormatter.string(from: date)
    }
}


